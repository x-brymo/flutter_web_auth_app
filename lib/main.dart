import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_app/UI/screens/home/home_page.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(  MainApp());
}

class MainApp extends StatelessWidget {
    MainApp({super.key});
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
     // showSemanticsDebugger: true,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home:  HomePage()
    );
  }
}
