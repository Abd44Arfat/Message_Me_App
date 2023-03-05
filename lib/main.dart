import 'package:flutter/material.dart';
import 'package:the_last_firebase/firebase_options.dart';
import 'package:the_last_firebase/screens/chatpage.dart';
import 'package:the_last_firebase/screens/login_page_screen.dart';
import 'package:the_last_firebase/screens/register%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_last_firebase/screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,

  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
  
        "loginpage": (context) => loginpage(),
        "registerpage": (context) => registerpage(),
        "chatpage": (context) => ChatPage(),
        "welcome_screen": (context) => welcome_screen(),

      },
      initialRoute: 'welcome_screen',
    );
  }
}
