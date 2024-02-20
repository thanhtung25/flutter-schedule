import 'package:flutter/material.dart';
class HomeScheduleIcon extends StatelessWidget{
  const HomeScheduleIcon ({super.key});
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width / 1.8,
      child: Image.asset(
        'assets/images/schedule/rong.jpeg',
        fit: BoxFit.cover,
        ),
    );
  }
}