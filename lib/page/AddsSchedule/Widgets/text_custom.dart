import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget{
  const TextCustom ({super.key, required this.nameTitle});
  final String nameTitle;
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: Text(
                      nameTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Times New Roman',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
    );
  }
}