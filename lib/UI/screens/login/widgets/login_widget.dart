import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/UI/components/custom_textfeild.dart';
import 'package:flutter_web_auth_app/UI/screens/home/home_page.dart';
import 'package:flutter_web_auth_app/UI/screens/register/widgets/animate_linner.dart';
import 'package:flutter_web_auth_app/utils/plugin/query_plugin.dart';
import 'package:flutter_web_auth_app/utils/shared/cash_halper.dart';
import 'package:flutter_web_auth_app/utils/shared/valdation.dart';
import 'package:flutter_web_auth_app/utils/toast/toast_show.dart';
import 'package:flutter_web_auth_app/utils/widget/custom_login_soacial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignINForm extends StatefulWidget {
  const SignINForm({super.key});

  @override
  State<SignINForm> createState() => _SignINFormState();
}

class _SignINFormState extends State<SignINForm> {
  final password = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey();
  double _formProgress = 0;
  bool scux = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: Form(
        key: keyForm,
        onChanged: _updateFormProgress,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedProgressIndicator(value: _formProgress),
            const SizedBox(
              height: 15,
            ),
            Text('Sign IN', style: Theme.of(context).textTheme.headlineMedium),
            CustomTextFeild(
                controller: username,
                labelText: "UserName Or Email",
                scuX: false,
                readOnly: false,
                validator: (vl) {
                  if (!vl!.isValidEmail) return 'Enter valid email';
                }),
            CustomTextFeild(
              controller: password,
              labelText: "Password",
              scuX: scux,
              readOnly: false,
              validator: (vl) {
                if (!vl!.isValidPassword) return 'Enter valid password';
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: SizedBox(
                width: double.infinity,
                height: 45.0,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.white;
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.deepOrange;
                    }),
                  ),
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      loginIn(username.text, password.text);
                     ToastShowWidget.showToast(context , Colors.greenAccent, "Success Loged an Account", "Goood Work Bro ☺");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (s) => HomePage()));
                    }
                  }, //=>
                  // _formProgress ==1 ?
                  //Navigator.push(context, MaterialPageRoute(builder: (s)=> DashBoardScreen() )) : null ,
                  child: const Text('Sign IN'),
                ),
              ),
            ),
            15.getHeight,
            const CustomButtonsAuth(
              icon: BootstrapIcons.google,
              nameSign: "SignIn by Google",
              color: Colors.white,
            ),
            CustomButtonsAuth(
                icon: FontAwesomeIcons.facebook,
                nameSign: "SignIn by Facebook",
                color: Colors.blue,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    )),
            CustomButtonsAuth(
                icon: BootstrapIcons.github,
                nameSign: "SignIn by Github",
                color: Colors.black,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    )),
            CustomButtonsAuth(
                icon: BootstrapIcons.x,
                nameSign: "SignIn by X",
                color: Colors.blue,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    )),
          ],
        ),
      ),
    );
  }

  Future<void> loginIn(String email, String password) async {
    //FirebaseAuthWeb firebaseAuthWeb = FirebaseAuthWeb.instance;
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = auth.currentUser;
      String? uid = user!.uid;
      String? firstName = user.displayName;
      String? lastName = user.displayName;
      String emails = user.email!;
      String? username = user.uid;
      Future<String?> token = user.getIdToken(true);
      await CashHelper.saveData("uid", uid);
      await CashHelper.saveData("firstName", firstName);
      await CashHelper.saveData("lastName", lastName);
      await CashHelper.saveData("emails", emails);
      await CashHelper.saveData("username", username);
      await CashHelper.saveData("token", token);
     ToastShowWidget.showToast(context , Colors.greenAccent, "Success Loged ann Account", "Goood Work Bro ☺");
      print(user);
    } catch (e) {
      FirebaseAuthException(code: e.toString());
      ToastShowWidget.showToast(context , Colors.red, e.toString(), "Show Error Bro ☺");
      print(e.toString());
    }
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [password, username];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }
}
