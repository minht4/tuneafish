import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/views/schedule.dart';
import 'package:getxtest/views/database.dart';
import 'package:getxtest/views/home.dart';
import 'package:getxtest/views/settings.dart';
import 'controllers/dashboard_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  DashboardController dashboardController = Get.put(DashboardController());

  final List<Widget> screens = [
    HomeScreen(),
    ScheduleScreen(),
    DatabaseScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                  height: 100,
                ),
                Obx(() =>
                    screens.elementAt(dashboardController.selectedTab.value))
              ],
            ),
          ),
        ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Database'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: dashboardController.selectedTab.value,
        onTap: (tab) => dashboardController.selectedTab.value = tab,
      ),
    ));
  }
}
