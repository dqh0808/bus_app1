import 'package:bus_app/pages/detail_route_driver_page.dart';
import 'package:bus_app/pages/detail_route_page.dart';
import 'package:bus_app/pages/map.dart';
import 'package:bus_app/pages/profile_page.dart';
import 'package:bus_app/pages/home_admin_page.dart';
import 'package:bus_app/pages/home_driver_page.dart';
import 'package:bus_app/pages/home_user_page.dart';
import 'package:bus_app/pages/login_page.dart';
import 'package:bus_app/pages/notification_page.dart';
import 'package:bus_app/pages/test.dart';
import 'package:bus_app/widget/SwitchCustom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/home_admin': (context) => const HomeAdminPage(),
        '/home_driver': (context) => const HomeDriverPage(),
        '/home_user': (context) => const HomeUserPage(),
        '/login': (context) => const LoginPage(),
        '/notification': (context) => const NotificatonPage(),
        '/profile': (context) =>  const ProfilePage(),
        '/detail_route': (context) =>  const DetailRoutePage(),
        '/detail_route_driver': (context) =>  const DetailRouteDriverPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Test(),
    );
  }
}


