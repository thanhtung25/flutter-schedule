import 'package:flutter/material.dart';

class MsgDialog{
  static void showMsgDialog(BuildContext context,String title, String msg){
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        FloatingActionButton(
          child: const Text("Ok"),
          onPressed: (){
            Navigator.of(context).pop(MsgDialog());
          }
          )
      ],
    ));
  }
}