export declare class SignInWithApple {
  signin: (options: any, success: (winParam: any) => void, error: (error: any) => void) => void;
  signinPromise: (options: any) => Promise<any>;
}
