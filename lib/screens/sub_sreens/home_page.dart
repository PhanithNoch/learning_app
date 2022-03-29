import 'package:flutter/material.dart';
import 'package:learning_app/screens/sub_sreens/home_dashboard_screen.dart';
import 'package:learning_app/screens/sub_sreens/notification_dashboard_screen.dart';
import 'package:learning_app/screens/sub_sreens/profile_dashboard_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectIndex = 0;
  List<Widget> lstWidgets = [
    HomeDashboardScreen(),

    /// home screen
    NotificationDashboardScreen(),

    /// notification
    ProfileDashboardScreen()

    /// profile screen
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: lstWidgets[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
          print(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
