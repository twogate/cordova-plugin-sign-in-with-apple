#import <AuthenticationServices/AuthenticationServices.h>
#import <Cordova/CDVPlugin.h> // this already includes Foundation.h

@interface SignInWithApple : CDVPlugin {
}
@end

@implementation SignInWithApple
- (void)pluginInitialize {
  NSLog(@"SignInWithApple initialize");
}

- (void)signin:(CDVInvokedUrlCommand *)command {
  NSLog(@"SignInWithApple signin()");
  if (@available(iOS 13, *)) {
    ASAuthorizationAppleIDProvider *provider =
        [[ASAuthorizationAppleIDProvider alloc] init];
    ASAuthorizationAppleIDRequest *request = [provider createRequest];
    [request setRequestedScopes:@[
      ASAuthorizationScopeFullName, ASAuthorizationScopeEmail
    ]];

    [request setRequestedScopes:@[
      ASAuthorizationScopeFullName, ASAuthorizationScopeEmail
    ]];
    ASAuthorizationController *controller = [[ASAuthorizationController alloc]
        initWithAuthorizationRequests:@[ request ]];
    [controller performRequests];
    CDVPluginResult *result =
        [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result
                                callbackId:command.callbackId];
  } else {
    NSLog(@"SignInWithApple signin() ignored because your iOS version < 13");
  }
}
@end
