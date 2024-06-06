

import 'package:appschedule/page/AddsSchedule/adds_schedule.dart';
import 'package:appschedule/page/Home/home_page.dart';
import 'package:appschedule/page/Login/login_page.dart';
import 'package:appschedule/page/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
  
    final GoRouter _router = GoRouter(routes: <GoRoute>[
    GoRoute(
      routes: <GoRoute>[
        GoRoute(
            path: 'homepage',
            builder: (context, state) => const HomePage(),
            routes: <GoRoute>[
              GoRoute(
                path: 'addschedule',
                builder: (context, state) => const AddsSchedule(),
              ),
              GoRoute(
                path: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ]),
      ],
      path: '/',
      builder: (context, state) => const LoginPage(),
    )
  ]);
}


