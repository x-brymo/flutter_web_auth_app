import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/UI/screens/register/widgets/sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width:600,
          height: 600,
          child: Card(
            //margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
