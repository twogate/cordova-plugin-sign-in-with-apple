"use strict";

var exec = require('cordova/exec');

var SignInWithApple = {
  signin: function(opt, success, error) {
    exec(success, error, "SignInWithApple", "signin", [opt]);
  },

  signinPromise: function(opt) {
    return new Promise((resolve, reject) => {
      exports.signin(opt, (result) => {
        resolve(result);
      }, (error) => {
        reject(error);
      }, params);
    });
  },
}

module.exports = SignInWithApple;
