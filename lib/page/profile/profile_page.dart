import 'package:appschedule/page/profile/Widgets/EditProfile.dart';
import 'package:appschedule/page/profile/Widgets/avatar_profile.dart';
import 'package:appschedule/page/profile/Widgets/help.dart';
import 'package:appschedule/page/profile/Widgets/inviteafrienf.dart';
import 'package:appschedule/page/profile/Widgets/my_stats.dart';
import 'package:appschedule/page/profile/Widgets/settingprofile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: const Color(0xffFF9E74 ),
      appBar: AppBar(
        centerTitle:false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_outlined, color: Colors.white,size: 30,),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          'Back',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w600 ,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: (){},
               icon: const Icon(
                Icons.photo_camera,
                color: Colors.white,
               )
            ),
          )
        ],
      ),

      body:  Center(
        child: Column(
          children: [
            const AvatarProfile(),
            Expanded(
              flex: 1,
              child: Container(
                decoration:const BoxDecoration(
                  color: Color(0xffFBEEE4),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                ),
                child:   const Column(
                  children: [
                    Expanded
                    (
                      flex: 3,
                      child: Column(
                      children: [
                        SizedBox(height: 30,),
                        EditProfile(),
                        MyStats(),
                        SettingProfile(),
                      ],
                    )),
                    Padding(
                      padding: EdgeInsets.only(left:20.0,right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                     
                    Expanded
                    (
                      flex: 2,
                      child: Column(
                      children: [
                        InviteAFriend(),
                        HelpProfile(),
                        SizedBox(height: 30,),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}