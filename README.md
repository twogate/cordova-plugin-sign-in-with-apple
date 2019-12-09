# cordova-plugin-sign-in-with-apple

This plugin only supports iOS >= 13.

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
```javascript
window.cordova.plugins.SignInWithApple.signin(
  { requestedScopes: [0, 1] },
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

## Options Example

- `requestedScopes` is an array of requested scopes.
  - `0`: `FullName`
  - `1`: `Email`

## Success Callback Data Example
Based on [ASAuthorizationAppleIDCredential](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential?language=objc).

- [authorizationCode](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential/3153032-authorizationcode?language=objc): string `"<short-lived token used by your app for proof of authorization when interacting with the app’s server counterpart>"`
- [email](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential/3180383-email?language=objc): string `"address@example.com"`
- [fullName](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential/3180384-fullname?language=objc): object, based on [NSPersonNameComponents](https://developer.apple.com/documentation/foundation/nspersonnamecomponents?language=objc)
    - [familyName](https://developer.apple.com/documentation/foundation/nspersonnamecomponents/1413354-familyname?language=objc): string `"Doe"`
    - [givenName](https://developer.apple.com/documentation/foundation/nspersonnamecomponents/1407259-givenname?language=objc): string `"Jane"`
    - [namePrefix](https://developer.apple.com/documentation/foundation/nspersonnamecomponents/1410275-nameprefix?language=objc): string `""`
    - [nameSuffix](https://developer.apple.com/documentation/foundation/nspersonnamecomponents/1410776-namesuffix?language=objc): string `""`
    - [nickname](https://developer.apple.com/documentation/foundation/nspersonnamecomponents/1414892-nickname?language=objc): string `""`
    - phoneticRepresentation: object, based on [NSPersonNameComponents](https://developer.apple.com/documentation/foundation/nspersonnamecomponents/1412193-phoneticrepresentation?language=objc)
        - familyName?: string
        - givenName?: string
        - namePrefix?: string
        - nameSuffix?: string
        - nickname?: string
- [identityToken](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential/3153035-identitytoken?language=objc): string `"<JSON Web Token (JWT) that securely communicates information about the user to your app>"`
- [state](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential/3153036-state?language=objc): string `"<arbitrary string that your app provided to the request that generated the credential>"`
- [user](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential/3153037-user?language=objc): string `"<identifier associated with the authenticated user>"`

## Failure Callback Data Example
- error: string `"ASAUTHORIZATION_ERROR"`
- code: string `1001`
- localizedDescription: string `"The operation couldn’t be completed. (com.apple.AuthenticationServices.AuthorizationError error 1001.)"`
- localizedFailureReason: string `""`

### Error Type
- `1000` `ASAuthorizationErrorUnknown`
    - [authorization attempt failed for an unknown reason](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrorunknown?language=objc)
- `1001` `ASAuthorizationErrorCanceled`
    - [user cancelled](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrorcanceled?language=objc)
- `1002` `ASAuthorizationErrorInvalidResponse`
    - [authorization request received an invalid response.](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrorinvalidresponse?language=objc)
- `1003` `ASAuthorizationErrorNotHandled`
    - [user cancelled](https://developer.apple.com/documentation/authenticationservices/asauthorizationerror/asauthorizationerrornothandled?language=objc)
