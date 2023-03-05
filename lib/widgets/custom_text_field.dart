import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  customtextfield({required this.hinttext, this.onchanged,this.obsecuretext=false});
  Function(String)? onchanged;
  String? hinttext;
  bool? obsecuretext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obsecuretext! ,
      validator: (val) {
        if (val!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onchanged,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
