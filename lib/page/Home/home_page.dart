

import 'package:appschedule/fire_base/database.dart';
import 'package:appschedule/page/AddsSchedule/adds_schedule.dart';
import 'package:appschedule/page/profile/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  Stream? EmployeeStream;
  Set<DateTime> datesWithData = {};
  Map<DateTime, int> datesWithEventsCount = {};
  @override
  void initState() {
   
    super.initState();
    loadingDetail();
    //getData();
    
  }
  loadingDetail()async{
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime.utc(now.year, now.month, 1);
    DateTime endOfMonth = DateTime.utc(now.year, now.month + 1, 0);
    String daynow = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} 00:00:00.000Z";
    EmployeeStream = await DatabaseMethods().getDetails(daynow);
    for (DateTime day = startOfMonth; day.isBefore(endOfMonth); day = day.add(Duration(days: 1))) {
      String formattedDate = "${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')} 00:00:00.000Z";
      var dayStream = await DatabaseMethods().getDetails(formattedDate);
      var snapshot = await dayStream.first; // Lấy snapshot đầu tiên từ stream
      // if (snapshot.docs.isNotEmpty) {
      //     datesWithData.add(day);
      //   }
      int eventCount = snapshot.docs.length;
      if (eventCount > 0) {
          datesWithEventsCount[day] = eventCount;  // Lưu trữ số lượng sự kiện cho mỗi ngày
      }
    }
    if (mounted) setState(() {});
  }

  getintheload(DateTime selectedDay) async {
  String formattedDate = "${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')} 00:00:00.000Z";
  EmployeeStream = await DatabaseMethods().getDetails(formattedDate);
  // EmployeeStream!.listen((snapshot) {
  //   if (snapshot.docs.isEmpty) {
  //     print("No data available for this day.");
  //   } else {
  //     snapshot.docs.forEach((doc) {
  //       DateTime date = DateTime.parse(doc['Day']);
  //       datesWithData.add(date);
  //       print(date);
  //     });
  //     setState(() {});
  //   }
  // }, onError: (error) {
  //   print("Error fetching data: $error");
  // });
  }

  Widget allDetails(){
    return StreamBuilder(
      stream: EmployeeStream, 
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị widget loading khi dữ liệu đang được tải
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          // Hiển thị thông báo lỗi nếu có lỗi xảy ra khi tải dữ liệu
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data == null) {
          // Kiểm tra xem có dữ liệu không và dữ liệu không phải là null
          return const Text('No data available');
        }

        // Bây giờ chúng ta có thể an toàn khi truy cập snapshot.data.docs

        List<DocumentSnapshot> docs = snapshot.data.docs;
        // Sắp xếp docs dựa trên 'FromTime'
        docs.sort((a, b) => a['FromTime'].compareTo(b['FromTime']));
        return snapshot.hasData? ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            //DocumentSnapshot ds = snapshot.data.docs[index];
            DocumentSnapshot ds = docs[index];
            return Padding(
        padding: const EdgeInsets.only(top: 20,left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration:BoxDecoration(
                color:const Color(0xffFF9E74),
                borderRadius: BorderRadius.circular(50)
              ),
              child:  Text(
                (index+1).toString(),
                textAlign:TextAlign.center,
                style:const TextStyle(
                  color: Colors.white,
                  fontFamily: "Times New Roman",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 30,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color:  const Color(0xffFFDEE8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Color.fromARGB(255, 242, 183, 242), spreadRadius:0 , blurRadius:10,offset: Offset(0.0, 5.0))
                  ]
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 10,
                      decoration: const BoxDecoration
                      (
                        color: Color(0xffFF95B6),
                        borderRadius: BorderRadius.horizontal(left:Radius.circular(20)),
                      ),
                      
                    ),
                     Padding(
                      padding:const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.punch_clock_sharp, color: Color.fromARGB(255, 251, 83, 136), ),
                              const SizedBox(width: 20,),
                              Text(
                                ds["FromTime"],
                                
                                style:const TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 251, 83, 136)
                                ),
                              ),
                              const Text(
                                ' - ',
                                style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 251, 83, 136)
                                ),
                                ),
                              Text(
                                ds["ToTime"],
                                style: const TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 251, 83, 136)
                                ),
                                ),
                              
                            ],
                          ),
                      
                          Padding(
                            padding:const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.touch_app,color: Color(0xffFF95B6),),
                                const SizedBox(width: 20,),
                                Text(
                                  ds["Title"],
                                  style:const TextStyle(
                                    fontFamily: "Times New Roman",
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xffFF95B6),
                                  ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  IconButton(
                    onPressed: () async {
                      await DatabaseMethods().DeleteDetail(ds["Id"]).then((_) {
                        // Tải lại dữ liệu sau khi xóa
                        loadingDetail();
                      }).catchError((error) {
                        // Xử lý lỗi nếu cần
                        print("Error deleting document: $error");
                      });
                    }, 
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 251, 83, 136))
                  )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
          },
          ): Container();
      }
    );
    
  }
  
  // getintheload() async{
  //   EmployeeStream = await DatabaseMethods().getDetails();
  //   setState(() {
      
  //   });
  // }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xffFF9E74),
        elevation:0,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15 )
          )
          
        ),
        flexibleSpace:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                 const Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const ProfilePage())
                      );
                    },
                    icon: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/schedule/avatar.jpeg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


      body: Container(
        color: const Color(0xffFBEEE4),
        child:  Column(
          children: [
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                           getintheload(_selectedDay);
                        },
                        eventLoader: (date) {
                          if (datesWithData.contains(date)) {
                            return ['Event'];  // Trả về danh sách sự kiện, mỗi sự kiện là một chuỗi đơn giản
                          }
                          return []; 
                        },
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, date, events) {
                            if (datesWithEventsCount.containsKey(date) && datesWithEventsCount[date]! > 0) {
                              int count = datesWithEventsCount[date]!;
                              List<Widget> markers = [];
                              for (int i = 0; i < count; i++) {
                                markers.add(_buildEventsMarker());
                                if (markers.length == 5) break; // Giới hạn số dấu chấm hiển thị, ví dụ tối đa 3
                              }
                              return Row(children: markers);
                            }
                            return null;
                          },
                        ),
                      
                      
                      ),
                    ),
                  ],
                ),
              ),
              
            ),
             Expanded(
              child: allDetails()),
          ],
        ),
      ),

    floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF9E74),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddsSchedule())
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 2.0,
        child:  const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,   
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          color: const Color(0xffFFE7D0),
          elevation: 0,
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color:  Color(0xffFF9E74),
                size: 30,
              ),
              onPressed: () {},
              
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color:  Color(0xffFF9E74),
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>const ProfilePage())
                );
              },
            ),
          ],
        )
      ),
      ),  
    );
  }
  Widget _buildEventsMarker() {
  return Container(
    width: 6, // Giảm kích thước nếu muốn hiển thị nhiều dấu chấm hơn
    height: 6,
    margin: const EdgeInsets.symmetric(horizontal: 1), // Khoảng cách giữa các dấu chấm
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue, // Có thể thay đổi màu sắc dựa trên loại sự kiện
    ),
  );
}

}


// class EventMarker extends StatelessWidget {
//   final Color color; // Màu sắc cho dấu chấm, có thể tùy chỉnh
//   final double size; // Kích thước của dấu chấm

//   const EventMarker({Key? key, this.color = Colors.red, this.size = 5.0}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: color,
//       ),
//     );
//   }
// }