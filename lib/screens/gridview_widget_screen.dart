import 'dart:math';

import 'package:flutter/material.dart';

class GridViewWidgetScreen extends StatelessWidget {
  GridViewWidgetScreen({Key? key}) : super(key: key);
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.deepPurpleAccent
  ];
  Random random = Random();

  // void changeIndex() {
  //   setState(() => index = random.nextInt(3));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Widget'),
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 3,
        ),
        itemBuilder: (context, index) {
          return GridViewItems(
            color: colors[index],
          );
        },
      ),
    );
  }
}

class GridViewItems extends StatelessWidget {
  final Color color;

  const GridViewItems({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        elevation: 10,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Column(
            children: [
              Container(
                height: 75,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Pngtree Man And Female Online Shopping Concept Illustration, Online',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/2.jpeg',
                fit: BoxFit.cover,
                height: 75,
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
