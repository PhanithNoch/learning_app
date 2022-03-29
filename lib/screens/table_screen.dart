import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Table Screen'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              DataTable(columns: const [
                DataColumn(
                    label: Text('ID',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Gender',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ], rows: const [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                ]),
              ])
            ],
          ),
        ));
  }
}
