# cordova-plugin-sign-in-with-apple

## Installation

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
