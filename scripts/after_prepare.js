#!/usr/bin/env node

'use strict';

var fs = require('fs');
var path = require('path');
var utilities = require("./lib/utilities");

module.exports = function (context) {
  //get platform from the context supplied by cordova
  var platforms = context.opts.platforms;
  // Copy key files to their platform specific folders
  if (platforms.indexOf('ios') !== -1 && utilities.directoryExists(IOS_DIR)) {
    console.log('Preparing Sign in with Apple on iOS');
    utilities.copyKey(PLATFORM.IOS);
  }
};
