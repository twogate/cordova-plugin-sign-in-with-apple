#import <AuthenticationServices/AuthenticationServices.h>
#import <Cordova/CDVPlugin.h> // this already includes Foundation.h

@interface SignInWithApple : CDVPlugin {
  NSMutableString *_callbackId;
}
@end

@implementation SignInWithApple
- (void)pluginInitialize {
  NSLog(@"SignInWithApple initialize");
}

- (void)signin:(CDVInvokedUrlCommand *)command {
  NSLog(@"SignInWithApple signin()");

  if (@available(iOS 13, *)) {
    _callbackId = command.callbackId;

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
    controller.delegate = self;
    [controller performRequests];

  } else {
    NSLog(@"SignInWithApple signin() ignored because your iOS version < 13");
  }

}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(nonnull ASAuthorization *)authorization
{
    ASAuthorizationAppleIDCredential *appleIDCredential = [authorization credential];

    NSError *error;

    NSDictionary *dic = @{
      @"user": appleIDCredential.user == nil || [appleIDCredential user],
      @"state": [appleIDCredential state],
      @"fullName": @{
        @"namePrefix": [[appleIDCredential fullName] namePrefix],
        @"givenName": [[appleIDCredential fullName] givenName],
        @"givenName": [[appleIDCredential fullName] middleName],
        @"familyName": [[appleIDCredential fullName] familyName],
        @"nameSuffix": [[appleIDCredential fullName] nameSuffix],
        @"nickname": [[appleIDCredential fullName] nickname],
        @"phoneticRepresentation": @{
          @"namePrefix": [[appleIDCredential fullName] namePrefix],
          @"givenName": [[appleIDCredential fullName] givenName],
          @"givenName": [[appleIDCredential fullName] middleName],
          @"familyName": [[appleIDCredential fullName] familyName],
          @"nameSuffix": [[appleIDCredential fullName] nameSuffix],
          @"nickname": [[appleIDCredential fullName] nickname]
        }
      },
      @"email": [appleIDCredential email],
//      @"identityToken": (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:[appleIDCredential identityToken]],
//      @"identityToken": (NSDictionary*) [NSKeyedUnarchiver unarchivedObjectOfClass:<#(nonnull Class)#> fromData:[appleIDCredential identityToken] error:error],
//      @"identityToken": (NSDictionary*) [NSKeyedUnarchiver unarchivedObjectOfClass:<#(nonnull Class)#> fromData:[appleIDCredential identityToken] error:error]
      @"identityToken": [[NSString alloc] initWithData:[appleIDCredential identityToken] encoding:NSUTF8StringEncoding]
    };

    // NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
    //                                                    options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
    //                                                      error:&error];

// if (! jsonData) {
//     NSLog(@"Got an error: %@", error);
// } else {
//     NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//     NSLog(@"json:%@\n",jsonString);
// }
   CDVPluginResult *result =
    [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: dic];
   [self.commandDelegate sendPluginResult:result
                               callbackId:_callbackId];
    // TODO: pass credentials to js
}


- (void) authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error
{
    NSLog(@"Failed");
    NSLog(@" error => %@ ", [error localizedDescription] );

    // TODO: raise error to js
}

@end
