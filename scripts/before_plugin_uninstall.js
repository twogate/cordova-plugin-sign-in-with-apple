// https://github.com/arnesson/cordova-plugin-firebase/blob/a32b126274b90d62e8c2a20205a137bc11941b76/scripts/ios/before_plugin_uninstall.js

var helper = require("./helper");

module.exports = function(context) {

    // Remove the build script that was added when the plugin was installed.
    var xcodeProjectPath = helper.getXcodeProjectPath(context);
    helper.removeShellScriptBuildPhase(context, xcodeProjectPath);
};
