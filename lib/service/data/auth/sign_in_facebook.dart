import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_web_auth_app/utils/shared/cash_halper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

////  [https://stackoverflow.com/questions/62471919/flutter-facebook-login-in-web] /////
////  [https://petercoding.com/firebase/2021/06/14/using-facebook-authentication-with-firebase-in-flutter/] /////
// class SignInFacebook {
//   static Future<UserCredential> signInWithFacebook() async {
//     try {
//       // Trigger the sign-in flow
//       final LoginResult loginResult = await FacebookAuth.instance.login();
      
//       // Check if the login was successful
//       if (loginResult.status == LoginStatus.success) {
//         // Create a credential from the access token
//         final AccessToken? accessToken = loginResult.accessToken;
//         if (accessToken != null) {
//           final OAuthCredential facebookAuthCredential =
//               FacebookAuthProvider.credential(accessToken.token);
          
//           // Save Facebook token to local storage
//           await CashHelper.saveData("tokenFacebook", accessToken.token);

//           // Once signed in, return the UserCredential
//           return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//         } else {
//           throw Exception("Facebook access token is null");
//         }
//       } else {
//         throw Exception("Facebook sign-in failed");
//       }
//     } catch (e) {
//       // Handle errors appropriately
//       print("Error signing in with Facebook: $e");
//       rethrow; // Rethrow the exception to propagate it up the call stack
//     }
//   }
// }
class SignInFacebook {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // static Future<UserCredential> signInWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
      
  //     // Check if the login was successful
  //     if (loginResult.status == LoginStatus.success) {
  //       // Create a credential from the access token
  //       final AccessToken? accessToken = loginResult.accessToken;
  //       if (accessToken != null) {
  //         final OAuthCredential facebookAuthCredential =
  //             FacebookAuthProvider.credential(accessToken.token);
          
  //         // Save Facebook token to local storage
  //         await CashHelper.saveData("tokenFacebook", accessToken.token);

  //         // Once signed in, return the UserCredential
  //         return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //       } else {
  //         throw Exception("Facebook access token is null");
  //       }
  //     } else {
  //       throw Exception("Facebook sign-in failed. Status: ${loginResult.status}");
  //     }
  //   } catch (e, stackTrace) {
  //     // Print the error and stack trace for debugging
  //     print("Error signing in with Facebook: $e\n$stackTrace");
  //     rethrow; // Rethrow the exception to propagate it up the call stack
  //   }
  // }
    Future<Resource?> signInWithFacebook() async {
      try {
      final LoginResult result = await FacebookAuth.instance.login();
    switch (result.status) {
      case LoginStatus.success:
        final AuthCredential facebookCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential =
            await auth.signInWithCredential(facebookCredential);
        return Resource(status: Status.Success);
      case LoginStatus.cancelled:
        return Resource(status: Status.Cancelled);
      case LoginStatus.failed:
        return Resource(status: Status.Error);
      default:
        return null;
      }
      } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await auth.signOut();
  }
}


class Resource{

   final Status status;
  Resource({required this.status});
}

enum Status {
  Success,
  Error,
  Cancelled
}
enum LoginType {
  Google,
  Twitter,
  Facebook
}