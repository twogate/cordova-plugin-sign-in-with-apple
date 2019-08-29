@objc(SignInWithApple) class SignInWithApple : CDVPlugin {
  func signin(command: CDVInvokedUrlCommand) {
    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    pluginResult = CDVPluginResult(
      status: CDVCommandStatus_OK,
      messageAsString: msg
    )

    self.commandDelegate!.sendPluginResult(
      pluginResult,
      callbackId: command.callbackId
    )
  }
}
