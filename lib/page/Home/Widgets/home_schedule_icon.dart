import 'package:flutter/material.dart';
class HomeScheduleIcon extends StatelessWidget{
  const HomeScheduleIcon ({super.key});
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 30,
      child: Image.asset(
        'assets/images/icons/icon_arrow_left.png',
        fit: BoxFit.cover,
        ),
    );
  }
}