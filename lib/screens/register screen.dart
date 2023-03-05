import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:the_last_firebase/screens/login_page_screen.dart';
import 'package:the_last_firebase/widgets/constants.dart';
import 'package:the_last_firebase/widgets/custom_btn.dart';
import 'package:the_last_firebase/widgets/custom_text_field.dart';

class registerpage extends StatefulWidget {
  registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Kprimarycolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 22,
                  ),
                  Image.asset(
                    'assets/images/sign in.gif',
                    height: 300,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Text(
                    "Message Me ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customtextfield(
                    onchanged: (data) {
                      email = data;
                    },
                    hinttext: "Enter your Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customtextfield(
                    onchanged: (data) {
                      password = data;
                    },
                    hinttext: "Enter your password",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  custom_btn(
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          Navigator.pushNamed(context, "welcome_screen");
                          showSnackBar(context, 'success');
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showSnackBar(context, 'weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context, 'email already exists');
                          }
                        } catch (ex) {
                          showSnackBar(context, 'there was an eror');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                    text: "Register",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "already have an account ? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 204, 21),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
