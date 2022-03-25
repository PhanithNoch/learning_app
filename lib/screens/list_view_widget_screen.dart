import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learning_app/screens/order_screen.dart';
// import '../models/order_model.dart';
import 'add_product_screen.dart';
import 'package:get_storage/get_storage.dart';

class ListViewWidgetScreen extends StatefulWidget {
  ListViewWidgetScreen({Key? key}) : super(key: key);

  @override
  State<ListViewWidgetScreen> createState() => _ListViewWidgetScreenState();
}

class _ListViewWidgetScreenState extends State<ListViewWidgetScreen> {
  // List<OrderModel> lstOrders = [];
  List lstOrders = [];
  final box = GetStorage();

  void fetchDataFromLocal() {
    var checkKeyIsContain = box.read('product');
    if (checkKeyIsContain != null) {
      lstOrders = jsonDecode(checkKeyIsContain);
    }
  }

  @override
  void initState() {
    fetchDataFromLocal();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.85),
      appBar: AppBar(
        title: const Text('Widget Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => OrderScreen(orderModel: lstOrders),
              //   ),
              // );
            },
            child: lstOrders.length > 0
                ? Container(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          alignment: Alignment.center,
                          child: Icon(Icons.shopping_cart),
                        ),
                        Positioned(
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              lstOrders.length.toString(),
                              style: const TextStyle(
                                  color: Colors.deepOrangeAccent, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Container(
                      child: Text('No Order'),
                    ),
                  ),
          ),
        ],
      ),
      body: lstOrders.isNotEmpty && lstOrders != null
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: lstOrders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        key: ValueKey(0),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   lstOrders.add(orders[index]);
                                // });
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        child: ListViewItemWidget(
                          ratingStart: 5,
                          desc: lstOrders[index]['desc'],
                          imgUrl: lstOrders[index]['imgURL'],
                          price: lstOrders[index]['price'],
                          title: lstOrders[index]['title'],
                        ),
                      );
                    },
                  ),
                ),

                // Expanded(
                //   child: ListView(
                //     scrollDirection: Axis.vertical,
                //     children: [

                //
                //     ],
                //   ),
                // ),
              ],
            )
          : Center(
              child: Container(
                child: Text('No Data'),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          ).then((_) {
            setState(() {
              fetchDataFromLocal();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListViewItemWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String price;
  final int ratingStart;
  final String imgUrl;

  const ListViewItemWidget(
      {required this.title,
      required this.desc,
      required this.price,
      required this.ratingStart,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    /// image section
                    Image.network(
                      imgUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),

                    /// text section
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 200,
                            child: Text(
                              title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 130,
                            child: Text(
                              desc,
                              style: TextStyle(fontSize: 11),
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              for (int i = 0; i < ratingStart; i++)
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.orange,
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10))),
                    child: Text(
                      price.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
