
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarApp extends StatefulWidget{
  const TableCalendarApp({super.key}); 
  @override
  State<TableCalendarApp> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendarApp> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context){
    return Padding(
              padding: const EdgeInsets.only(top:20.0,left: 20.0,right: 20.0),
              child: Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  // boxShadow: const [
                  //   BoxShadow(color: Color.fromARGB(255, 244, 154, 207), spreadRadius: 0, blurRadius: 10),
                  // ],
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
              
            );
  }
}