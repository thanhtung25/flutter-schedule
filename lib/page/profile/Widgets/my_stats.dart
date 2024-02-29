// ignore: file_names
import 'package:flutter/material.dart';

class MyStats extends StatelessWidget{
  const MyStats({super.key});
  @override
  Widget build(BuildContext context){
    return const Expanded(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 30,),
            Expanded(
              flex: 1,
              child: Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                    color: Color(0xffDEDEFC),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(Icons.stars,color: Color(0xff5B59F3),)
                    ), 
                  ),
                  SizedBox(width: 20,),
                  Text(
                  'My Stats',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_right_outlined),
          SizedBox(width: 30,),
        ],
      ),
    );
  }
}