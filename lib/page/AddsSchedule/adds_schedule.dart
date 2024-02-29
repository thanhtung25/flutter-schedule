
import 'package:appschedule/page/Home/home_page.dart';
import 'package:appschedule/page/Home/widgets/TableCalendarApp.dart';
import 'package:flutter/material.dart';



class AddsSchedule extends StatefulWidget{
  const AddsSchedule({super.key});

  @override
  State<AddsSchedule> createState() => _FirstPageState();
}


class _FirstPageState extends State<AddsSchedule> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFFBA54),
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
          SizedBox(
            width: 300,
            child: Image.asset('assets/images/schedule/lich.png')
          ),

          const TableCalendarApp(),
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
                      MaterialPageRoute(builder: (context)=>const HomePage())
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
