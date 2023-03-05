import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:the_last_firebase/helper/shoe_snackbar.dart';
import 'package:the_last_firebase/widgets/constants.dart';
import 'package:the_last_firebase/widgets/custom_btn.dart';
import 'package:the_last_firebase/widgets/custom_text_field.dart';


class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);


  @override
  State<loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<loginpage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Kprimarycolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/images/Online world-cuate.png',
                  height: 350,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Message Me',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontFamily: 'pacifico',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                customtextfield(
                  onchanged: (data) {
                    email = data;
                  },
                  hinttext: 'Email',
                ),
                SizedBox(
                  height: 10,
                ),
                customtextfield(
                  obsecuretext: true,
                  onchanged: (data) {
                    password = data;
                  },
                  hinttext: 'Password',
                ),
                SizedBox(
                  height: 20,
                ),
                custom_btn(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushNamed(context, "chatpage",
                            arguments: email);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          showSnackBar(context, 'user not found');
                        } else if (ex.code == 'wrong-password') {
                          showSnackBar(context, 'wrong password');
                        }
                      } catch (ex) {
                        print(ex);
                        showSnackBar(context, 'there was an error');
                      }

                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'Login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont\'t have an account?',
                      style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "registerpage");
                      },
                      child: Text(
                            "Register",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 204, 21),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          )
                      
                    ),
                    
                  ],
                ),
             
              ],
            ),
               
          ),
        ),
           
        
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
