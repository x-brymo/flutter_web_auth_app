import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/UI/screens/login/widgets/login_widget.dart';

class SignINScreen extends StatelessWidget {
  const SignINScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child:SizedBox(
          height: 600,width: 600,
          child: Card(
              child: SignINForm(),
            ),
        ),
      ),
    );
  }
}

