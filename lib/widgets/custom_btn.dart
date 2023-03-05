import 'package:flutter/material.dart';

class custom_btn extends StatelessWidget {
  custom_btn({required this.text,this.ontap});
  VoidCallback? ontap;
  String? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 209, 158, 40),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text (text!,style:  TextStyle(color: Colors.white),) ,
        ),
      ),
    );
  }
}
