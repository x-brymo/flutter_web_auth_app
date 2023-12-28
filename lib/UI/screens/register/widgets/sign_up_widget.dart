import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/UI/components/custom_textfeild.dart';
import 'package:flutter_web_auth_app/UI/screens/login/login_screen.dart';
import 'package:flutter_web_auth_app/UI/screens/register/widgets/animate_linner.dart';
import 'package:flutter_web_auth_app/utils/shared/valdation.dart';
import 'package:flutter_web_auth_app/utils/toast/toast_show.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final username = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  double _formProgress = 0;
  bool scux = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      key: keyForm,
      child: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedProgressIndicator(value: _formProgress),
            const SizedBox(
              height: 15,
            ),
            Text('Sign up', style: Theme.of(context).textTheme.headlineMedium),
            CustomTextFeild(
              controller: firstName,
              labelText: "Enter FirstName",
              scuX: false,
              readOnly: false,
              validator: (vl) {
              if (!vl!.isValidName) return 'Enter valid firstname';
              return null;
              },
            ),
            CustomTextFeild(
                controller: lastName,
                labelText: "Enter LastName",
                scuX: false,
                readOnly: false,
                validator: (vl) {
                if (!vl!.isValidName) return 'Enter valid lastname';
                return null;
                }),
            CustomTextFeild(
                controller: username,
                labelText: "Enter UserName",
                scuX: false,
                readOnly: false,
                validator: (vl) {
                 if (!vl!.isValidEmail) return 'Enter valid username';
                 return null;
                }),
            CustomTextFeild(
                controller: email,
                labelText: "Enter Email",
                scuX: false,
                readOnly: false,
                validator: (vl) {
                 if (!vl!.isValidEmail) return 'Enter valid email';
                 return null;
                }),
            CustomTextFeild(
                controller: password,
                labelText: "Enter Password",
                scuX: scux,
                readOnly: false,
                validator: (vl) {
                 if (!vl!.isValidPassword) return 'Enter valid password';
                 return null;
                }),
            Container(
              padding: const EdgeInsets.only(right: 25, left: 25),
              height: 40,
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : Colors.deepOrange;
                  }),
                ),
                onPressed: () {
                  keyForm.currentState!.validate();
                  ToastShowWidget.showToast(context , Colors.red,"Check Validations Form", "Show Error Bro ☺");
                  // if (keyForm.currentState!.validate()) {
                  //   signUp(firstName.text, lastName.text, username.text, email.text, password.text);
                  // }
                },
                child: const Text('Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      username,
      email,
      password,
      firstName,
      lastName,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  final keyForm = GlobalKey<FormState>();
  Future<void> signUp(String firstName, String lastName, String userName,
      String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential? userCredential;
    // FirebaseAuthWeb firebaseAuthWeb =FirebaseAuthWeb.instance;
    // UserPlat user = FirebaseAuthWeb.instance.currentUser;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential!.user!
          .updateProfile(displayName: "$firstName $lastName");
      // You can also send a verification email if desired
      await userCredential.user!.sendEmailVerification();
      ToastShowWidget.showToast(context , Colors.greenAccent, "Success Created Account", "Goood Work Bro ☺");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) => const SignINScreen()));
    } catch (e) {
      print(e);
    }
  }

  Future<void> googleSignUp() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in to Firebase with Google credentials
        await FirebaseAuth.instance.signInWithCredential(credential);

        // Navigate to the desired screen after successful sign-in
        // For example:
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        // Google Sign-In was canceled
      }
    } catch (e) {
      // Handle the error
      print("Google Sign-In Error: $e");
    }
  }
}
