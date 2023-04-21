/*
Script creates entitlements file with the list of hosts, specified in config.xml.
File name is: ProjectName.entitlements
Location: ProjectName/

Script only generates content. File it self is included in the xcode project in another hook: xcodePreferences.js.
*/

var path = require('path');
var fs = require('fs');
var plist = require('plist');
var mkpath = require('mkpath');
var ConfigXmlHelper = require('../configXmlHelper.js');
var APPLE_SIGN_IN_KEY = 'com.apple.developer.applesignin';
var context;
var projectName;
var entitlementsFilePath;

module.exports = {
  generateAssociatedDomainsEntitlements: generateEntitlements
};

// region Public API

/**
 * Generate entitlements file content.
 *
 * @param {Object} cordovaContext - cordova context object
 * @param {Object} pluginPreferences - plugin preferences from config.xml; already parsed
 */
function generateEntitlements(cordovaContext) {
  context = cordovaContext;

  var currentEntitlements = getEntitlementsFileContent();
  var newEntitlements = injectPreferences(currentEntitlements);

  saveContentToEntitlementsFile(newEntitlements);
}

// endregion

// region Work with entitlements file

/**
 * Save data to entitlements file.
 *
 * @param {Object} content - data to save; JSON object that will be transformed into xml
 */
function saveContentToEntitlementsFile(content) {
  var plistContent = plist.build(content);
  var filePath = pathToEntitlementsFile();

  // ensure that file exists
  mkpath.sync(path.dirname(filePath));

  // save it's content
  fs.writeFileSync(filePath, plistContent, 'utf8');
}

/**
 * Read data from existing entitlements file. If none exist - default value is returned
 *
 * @return {String} entitlements file content
 */
function getEntitlementsFileContent() {
  var pathToFile = pathToEntitlementsFile();
  var content;

  try {
    content = fs.readFileSync(pathToFile, 'utf8');
  } catch (err) {
    return defaultEntitlementsFile();
  }

  return plist.parse(content);
}

/**
 * Get content for an empty entitlements file.
 *
 * @return {String} default entitlements file content
 */
function defaultEntitlementsFile() {
  return {};
}

/**
 * Inject list of hosts into entitlements file.
 *
 * @param {Object} currentEntitlements - entitlements where to inject preferences
 * @return {Object} new entitlements content
 */
function injectPreferences(currentEntitlements) {
  var newEntitlements = currentEntitlements;
  newEntitlements[APPLE_SIGN_IN_KEY] = ['Default'];

  return newEntitlements;
}

// endregion

// region Path helper methods

/**
 * Path to entitlements file.
 *
 * @return {String} absolute path to entitlements file
 */
function pathToEntitlementsFile() {
  if (entitlementsFilePath === undefined) {
    entitlementsFilePath = path.join(getProjectRoot(), 'platforms', 'ios', getProjectName(), 'Resources', getProjectName() + '.entitlements');
  }

  return entitlementsFilePath;
}

/**
 * Projects root folder path.
 *
 * @return {String} absolute path to the projects root
 */
function getProjectRoot() {
  return context.opts.projectRoot;
}

/**
 * Name of the project from config.xml
 *
 * @return {String} project name
 */
function getProjectName() {
  if (projectName === undefined) {
    var configXmlHelper = new ConfigXmlHelper(context);
    projectName = configXmlHelper.getProjectName();
  }

  return projectName;
}

// endregion
