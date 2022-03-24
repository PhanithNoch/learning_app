import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_app/models/hive_storage.dart';

import '../models/product_model.dart';
import 'package:hive/hive.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCon = TextEditingController();
  TextEditingController descCon = TextEditingController();
  TextEditingController priceCon = TextEditingController();
  TextEditingController imgCon = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        actions: [
          TextButton(
              onPressed: () {
                box.remove('product');
              },
              child: Text(
                'Remove Old key',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameCon,
                decoration: const InputDecoration(hintText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: descCon,
                decoration: const InputDecoration(hintText: "Description"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: priceCon,
                decoration: const InputDecoration(hintText: "Price"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: imgCon,
                decoration: const InputDecoration(hintText: "Image URL"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        List lstProduct = [];
                        List getProductList = [];
                        if (_formKey.currentState!.validate()) {
                          var checkKeyIsContain = box.read('product');
                          if (checkKeyIsContain != null) {
                            lstProduct.addAll(jsonDecode(checkKeyIsContain));
                          }
                          Map productModel = {
                            'title': nameCon.text,
                            'price': priceCon.text,
                            'desc': descCon.text,
                            'imgURL': imgCon.text,
                          };
                          lstProduct.add(productModel);
                          // // print(jsonEncode(json));
                          box.write('product', jsonEncode(lstProduct));
                          //
                          var jsonDecodeString = box.read('product');
                          getProductList = jsonDecode(jsonDecodeString);
                          print(getProductList[0]);
                          clearTextFields();
                        }

                        /// get values from each textformfiled
                      },
                      child: const Text('Save'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void clearTextFields() {
    nameCon.text = '';
    priceCon.text = '';
    descCon.text = '';
    imgCon.text = '';
  }
}
