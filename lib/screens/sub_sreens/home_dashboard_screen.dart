import 'package:flutter/material.dart';
import 'package:learning_app/screens/sub_sreens/notification_dashboard_screen.dart';
import 'package:learning_app/services/singleton.dart';

class HomeDashboardScreen extends StatelessWidget {
  HomeDashboardScreen({Key? key}) : super(key: key);
  Singleton singleton = Singleton();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Dashboard'),
      // ),
      body: Center(
        child: TextButton(
          child: Text('Home Dashboard'),
          onPressed: () {
            singleton.message = "hello world!";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationDashboardScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
