import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:flutter/material.dart';
class SignInByGithub{
static void gitHubSignIn(BuildContext context) async {
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
    clientId: 'abd975f97f953c6e1843',
    clientSecret: '709fb6441354c8d148248ae2cab0673b4ce7f1d5',
    redirectUrl: 'https://l2t-flutter.firebaseapp.com/__/auth/handler',
    title: 'GitHub Connection',
    centerTitle: false,
  );
    var result = await gitHubSignIn.signIn(context);
    switch (result.status) {
      case GitHubSignInResultStatus.ok:
        print(result.token);
        break;
      case GitHubSignInResultStatus.cancelled:
      case GitHubSignInResultStatus.failed:
        print(result.errorMessage);
        break;
    }
  }
}
// url setting github: https://github.com/settings/applications/new
//https://flutter-web-auth-app.firebaseapp.com/__/auth/handler
//  client id secrt:4b48ea09c3a399b1c3b297693c9f1fdaf772f7c8
// client id :03d4af59f6af03408e63