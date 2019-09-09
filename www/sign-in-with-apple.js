var exec = require('cordova/exec');

exports.signin = function(opt, success, error) {
  exec(success, error, "SignInWithApple", "signin", [opt]);
};

exports.signinPromise = function(opt) {
  return new Promise((resolve, reject) => {
    exports.signin(opt, (result) => {
      resolve(result);
    }, (error) => {
      reject(error);
    }, params);
  });
};
