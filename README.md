# cordova-plugin-sign-in-with-apple

## Installation

```
cordova plugin add https://githu
b.com/twogate/cordova-plugin-sign-in-with-apple.git --variable USESWIFTLANGUAGEVERSION=5
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
