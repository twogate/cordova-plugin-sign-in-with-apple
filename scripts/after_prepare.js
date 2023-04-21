/**
Hook is executed at the end of the 'prepare' stage. Usually, when you call 'cordova build'.

It will inject required preferences in the platform-specific projects, based on <universal-links>
data you have specified in the projects config.xml file.
*/

var iosProjectEntitlements = require('./lib/ios/projectEntitlements.js');
var IOS = 'ios';

module.exports = function(ctx) {
  run(ctx);
};

/**
 * Execute hook.
 *
 * @param {Object} cordovaContext - cordova context object
 */
function run(cordovaContext) {
  var platformsList = cordovaContext.opts.platforms;

  platformsList.forEach(function(platform) {
    switch (platform) {
      case IOS:
        {
          // generate entitlements file
          iosProjectEntitlements.generateAssociatedDomainsEntitlements(cordovaContext);
          break;
        }
    }
  });
}