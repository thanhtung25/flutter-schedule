// ignore: file_names
import 'package:flutter/material.dart';

class HelpProfile extends StatelessWidget{
  const HelpProfile({super.key});
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
                    color: Color(0xffD1D1D1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(Icons.help_center,color: Colors.black,)
                    ), 
                  ),
                  SizedBox(width: 20,),
                  Text(
                  'Help',
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