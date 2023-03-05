import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:the_last_firebase/widgets/constants.dart';
import 'package:the_last_firebase/widgets/custom_btn.dart';


class welcome_screen extends StatefulWidget {
  const welcome_screen({super.key});
  static const String screenRoute = 'welcome_screen';
  @override
  State<welcome_screen> createState() => _welcome_screenState();
}

class _welcome_screenState extends State<welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kprimarycolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 310,
                  child: Image.asset('assets/images/Voice chat-pana.png'),
                ),
                Text(
                  "MessageMe",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 233, 235, 237)),
                ),
                SizedBox(
                  height: 15,
                ),
          
                custom_btn(
                  text: "Login",
                  ontap: (){
                    Navigator.pushNamed(context, "loginpage");
                  },
                ),
                      SizedBox(height: 25,),
                custom_btn(
          
            text: "Sign up ",
                  ontap: (){
                    Navigator.pushNamed(context, "registerpage");
                    },
                
          
              
                  
              
                ),
              ],
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
