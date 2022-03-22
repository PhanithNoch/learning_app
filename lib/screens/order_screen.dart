import 'package:flutter/material.dart';
import 'package:learning_app/models/order_model.dart';

class OrderScreen extends StatefulWidget {
  final List<OrderModel> orderModel;
  const OrderScreen({Key? key, required this.orderModel}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Widget> listViewItems = [];
  void _buildListView() {
    for (var order in widget.orderModel) {
      listViewItems.add(Card(
        child: ListTile(
          title: Text(order.title),
          subtitle: Text(order.desc),
          leading: Image.network(order.imgUrl),
        ),
      ));
    }
  }

  @override
  void initState() {
    _buildListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: listViewItems,
      ),
    );
  }
}
