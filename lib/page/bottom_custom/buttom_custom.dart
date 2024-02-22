import 'package:appschedule/page/Home/home_page.dart';
import 'package:appschedule/page/detail/detail_page.dart';
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
      icon: Icon(Icons.book),label: 'Courses',
    ),    
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),label: 'Profile',
    ),
  ];
  
  List<Widget> listPage = [
    const HomePage(),
    const DetailPage(),
    const ProfilePage()
  ];
  int activePage = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: listPage[activePage],
      bottomNavigationBar: BottomNavigationBar(
        items: listItem,
        onTap: (index) {
          setState(() {
            activePage = index;
          });
        },
      ),     
    );
  }
}