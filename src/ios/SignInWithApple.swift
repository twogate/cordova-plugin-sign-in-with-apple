@objc(SignInWithApple) class SignInWithApple : CDVPlugin {
  func signin(command: CDVInvokedUrlCommand) {
    print("This is SIWA Plugin!")

    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    pluginResult = CDVPluginResult(
      status: CDVCommandStatus_OK
    )

    self.commandDelegate!.send(
      pluginResult,
      callbackId: command.callbackId
    )
  }
}
