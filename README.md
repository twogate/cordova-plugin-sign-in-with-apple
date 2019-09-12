# cordova-plugin-sign-in-with-apple

## Installation
### Plugin installation

```
cordova plugin add cordova-plugin-sign-in-with-apple
```

or

```
cordova plugin add https://github.com/twogate/cordova-plugin-sign-in-with-apple.git
```

# Usage
```
window.cordova.plugins.SignInWithApple.signin(
  null,
  function(succ){
    console.log(succ)
    alert(JSON.stringify(succ))
  },
  function(err){
    console.error(err)
    console.log(JSON.stringify(err))
  }
)
```

## Error Type
- `1000` `ASAuthorizationErrorUnknown`
    - [authorization attempt failed for an unknown reason](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrorunknown?language=objc)
- `1001` `ASAuthorizationErrorCanceled`
    - [user cancelled](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrorcanceled?language=objc)
- `1002` `ASAuthorizationErrorInvalidResponse`
    - [authorization request received an invalid response.](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrorinvalidresponse?language=objc)
- `1003` `ASAuthorizationErrorNotHandled`
    - [user cancelled](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrornothandled?language=objc)
