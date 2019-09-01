#import <AuthenticationServices/AuthenticationServices.h>
#import <Cordova/CDVPlugin.h> // this already includes Foundation.h

#ifndef SignInWithApple_h
#define SignInWithApple_h

@interface SignInWithApple : CDVPlugin
- (void)pluginInitialize;
- (void)signin:(CDVInvokedUrlCommand *)command;
@end

#endif /* SignInWithApple_h */
