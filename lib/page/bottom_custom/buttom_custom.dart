import 'package:appschedule/page/Home/home_page.dart';
import 'package:appschedule/page/profile/profile_page.dart';
import 'package:flutter/material.dart';

class ButtomCustom extends StatefulWidget{
  const ButtomCustom({super.key});

  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {
    List<BottomNavigationBarItem> listItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),label: 'Home',backgroundColor: Colors.black,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),label: 'Profile',backgroundColor: Colors.black,
    ),
  ];
  
  List<Widget> listPage = [
    const HomePage(),
    const ProfilePage()
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  } 
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      body: listPage[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFF9E74),
        onPressed: () {
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 94, 66, 123), spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            items: listItem,
            onTap: _onItemTapped,
          ),
        ),
      ),  

    );
  }
}