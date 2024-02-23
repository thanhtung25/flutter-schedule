

import 'package:appschedule/page/bottom_custom/buttom_custom.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget{
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFFBA54),
        leading: IconButton(
          onPressed: () {},
            icon: const Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 40,
            ),
        ),
        title:const Text(
          'Date',
          style: TextStyle(
            fontFamily: "Times New Romans",
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body:  Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(20),
          //   child: Text(
          //     'Option Date',
          //     style: TextStyle(
          //       fontSize: 24,
          //       fontFamily: "Times New Romans",
          //       fontWeight: FontWeight.w500,
          //     ),
          //     ),
          // ),
          SizedBox(
            width: 300,
            child: Image.asset('assets/images/schedule/lich.png')
          ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
          Expanded(
            child:  Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 45,
                width: double.infinity,
                margin: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const ButtomCustom())
                      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:const Color(0xffFFA013),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    elevation: 10,
                    shadowColor: Colors.black.withOpacity(0.5)
                  ),
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontFamily: "Times New Roman"
                    ),
                  ),
                ),
              ),
            )
          )
        ],
      )
    );
  }
}
