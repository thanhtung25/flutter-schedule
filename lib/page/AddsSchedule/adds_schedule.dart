


import 'package:appschedule/fire_base/database.dart';
import 'package:appschedule/page/AddsSchedule/Widgets/text_custom.dart';
import 'package:appschedule/page/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:table_calendar/table_calendar.dart';



class AddsSchedule extends StatefulWidget{
  const AddsSchedule({super.key});

  @override
  State<AddsSchedule> createState() => _FirstPageState();
}


class _FirstPageState extends State<AddsSchedule> {

  // foscuedDay
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  // title
  final TextEditingController title = TextEditingController();
    // create TimeOfDay variable
  TimeOfDay fromTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay toTime = const TimeOfDay(hour: 0, minute: 0);
  //show time picker method
  Future<void> _selectFromTime() async {
    TimeOfDay ? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(picked !=null) {
      setState(() {
        fromTime = picked;
      });
    }
  }

  Future<void> _selectToime() async {
    TimeOfDay ? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(picked !=null) {
      setState(() {
        toTime = picked;
      });
    }
  }

  bool light1 = true;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffFF9E74),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: 0,

        backgroundColor: Colors.transparent,
        leading:  IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  color: Colors.white, 
                  onPressed: () => Navigator.of(context).pop(),
                ),
        title: const Text(
                  'Back',
                  style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
      ),
      body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            height: 120,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Creat New Task',
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              )
          ),
           Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Color(0xffFBEEE4),
              ),
              child:   SingleChildScrollView(
                child: Column(
                  children: [
                    const TextCustom(nameTitle: 'Date'),
                    Padding(
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
                      
                    ),
                    const TextCustom(nameTitle: 'Time'),
                    // Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            const Text(
                                  "From",
                                  style: TextStyle(
                                    fontFamily: 'Times New Roman',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            
                            Container(
                              padding: const EdgeInsets.only(left: 40),
                              height: 40,
                              width: 140,
                              decoration:const BoxDecoration(
                                color: Color(0xffFF9E74),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    fromTime.format(context).toString(),
                                    style:const TextStyle(
                                      fontFamily: 'Times New Roman',
                                      color: Colors.white,
                                      fontSize: 18,
                                      
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: (){_selectFromTime();},
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,size: 18,),
                                    )
                                ],
                              ),
                            )
                          ],
                        ),

                        Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        const Text(
                              "To",
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        
                        Container(
                          padding: const EdgeInsets.only(left: 40),
                          height: 40,
                          width: 140,
                          decoration:const BoxDecoration(
                            color: Color(0xffFF9E74),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                toTime.format(context).toString(),
                                style:const TextStyle(
                                  fontFamily: 'Times New Roman',
                                  color: Colors.white,
                                  fontSize: 18,
                                  
                                ),
                              ),
                              IconButton(
                                onPressed: (){_selectToime();},
                                icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,size: 18,),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                      ],
                    ),

  
                    const TextCustom(nameTitle: 'Title'),

                    //  Title
                    Padding(
                      padding:const EdgeInsets.fromLTRB(20.0,  10.0, 20.0, 0.0),
                      child: TextField(
                        controller: title,
                        style:const TextStyle(fontFamily: 'Times New Roman', fontSize: 12, color: Colors.black),
                        decoration:const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20,10,10,10),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Write the title",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                        ),
                      ),
                    ),
                    const TextCustom(nameTitle: 'Alaram'),
                    // add
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Switch(
                              thumbIcon: thumbIcon,
                              value: light1,
                              activeColor:const Color(0xffF89970),
                              onChanged: (bool value) {
                                setState(() {
                                  light1 = value;
                                });
                              },
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () async{
                            String Id = randomAlphaNumeric(100);
                            Map<String,dynamic> employeInfoMap ={
                              //"Day": _focusedDay.toString(),
                              "Day": "${_focusedDay.year}-${_focusedDay.month.toString().padLeft(2, '0')}-${_focusedDay.day.toString().padLeft(2, '0')} 00:00:00.000Z",
                              "FromTime": fromTime.format(context).toString(),
                              "ToTime": toTime.format(context).toString(),
                              "Id": Id,
                              "Title": title.text,
                            };
                            await DatabaseMethods().addDetails(employeInfoMap, Id).then((value) {
                              Fluttertoast.showToast(
                              msg: "Employee Datails has been uploaded successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.blue,
                              textColor: Colors.white,
                              fontSize: 16.0
                                );
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const HomePage())
                          );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin:const EdgeInsets.only(right: 20),
                            width: 100,
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffF89970),
                            ),
                            child:const Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Times New Roman",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              )
                            ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
