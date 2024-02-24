import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffCFC4FF).withOpacity(0.4),
      appBar: AppBar(
        backgroundColor:  Colors.white,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15 )
            
          )
          
        ),
        flexibleSpace: const SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Welcome to Schedule ",
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                CircleAvatar(
                  backgroundColor: Color(0xffFDCF09),
                  radius: 35,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/schedule/avatar.jpeg'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),


      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Color.fromARGB(255, 112, 83, 143), spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: TableCalendar(
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
            ),
            
          ),
        ],

      ),

    );
  }
}