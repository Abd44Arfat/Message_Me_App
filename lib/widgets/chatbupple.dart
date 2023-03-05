import 'package:flutter/material.dart';
import 'package:the_last_firebase/models/message.dart';
import 'package:the_last_firebase/widgets/constants.dart';

class chat_bupple extends StatelessWidget {
   chat_bupple({required this.message

  });
final  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 19, bottom: 19, right: 25),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Kprimarycolor,
        ),
        child: Text(
      message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////
class chat_bupple_to_another_user extends StatelessWidget {
   chat_bupple_to_another_user({required this.message

  });
final  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 19, bottom: 19, right: 25),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Colors.amberAccent,
        ),
        child: Text(
      message.message,
          style: TextStyle(color: Color.fromARGB(255, 10, 9, 9)),
        ),
      ),
    );
  }
}

