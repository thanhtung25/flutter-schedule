
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

class FirstPage extends StatefulWidget{
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}


class _FirstPageState extends State<FirstPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
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

          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format){
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay,focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            
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
