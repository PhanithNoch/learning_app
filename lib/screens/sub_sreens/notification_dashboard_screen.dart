import 'package:flutter/material.dart';
import 'package:learning_app/services/singleton.dart';

class NotificationDashboardScreen extends StatelessWidget {
  NotificationDashboardScreen({Key? key}) : super(key: key);
  Singleton s1 = Singleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Notification Screen'),
      // ),
      body: Center(
        child: Text(s1.message.toString()),
      ),
    );
  }
}
