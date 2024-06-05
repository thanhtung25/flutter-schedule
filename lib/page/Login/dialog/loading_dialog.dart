import 'package:flutter/material.dart';

class LoadingDialog{
  static void showLoadingDiglog(BuildContext context, String msg){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>  Dialog(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          color: Colors.white,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                msg,
                style: const TextStyle( fontSize: 18),
              ),
              ),
            
          ]),
        )
          
      )
     );
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog());
  }
}