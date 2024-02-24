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
      icon: Icon(Icons.home),label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),label: 'Profile',
    ),
  ];
  
  List<Widget> listPage = [
    const HomePage(),
    const ProfilePage()
  ];
  int activePage = 0;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      body: listPage[activePage],
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
            items: listItem,
            onTap: (index) {
              setState(() {
                activePage = index;
              });
            },
          ),
        ),
      ),     
    );
  }
}