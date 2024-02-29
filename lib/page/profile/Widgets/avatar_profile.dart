import 'package:flutter/material.dart';

class AvatarProfile extends StatelessWidget{
  const AvatarProfile({super.key});
  @override
  Widget build(BuildContext context){
    return const Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
              CircleAvatar(
                backgroundColor:  Colors.white,
                radius: 60,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/schedule/avatar.jpeg'),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Thanh Tung',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 28,
                  fontWeight:FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Developer Flutter ',
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 18,
                  fontWeight:FontWeight.normal,
                  color: Colors.white,
                ),
              ),
        ],
      ),
    );
  }
}