var exec = require('cordova/exec');

exports.signin = function(arg0, success, error) {
  exec(success, error, "SignInWithApple", "signin", [arg0]);
};

exports.test = function(plugName, methName) {
  exec((r) => console.log(r), (e) => console.error(e), plugName, methName, []);
};
