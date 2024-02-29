import 'package:appschedule/page/AddsSchedule/adds_schedule.dart';
import 'package:appschedule/page/Home/widgets/TableCalendarApp.dart';
import 'package:appschedule/page/Home/widgets/home_list.dart';
import 'package:appschedule/page/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: const Column(
          children: [
            TableCalendarApp(),
            Expanded(
              child: HomeList()),
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
}