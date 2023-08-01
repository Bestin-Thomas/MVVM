import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:untitled17/data_base/products.dart';
import 'data_base/model.dart';
import 'main.dart';


abstract class JsonPlaceHolderViewModel extends State<JsonPlaceHolder> {
  final baseUrl = "https://dummyjson.com";
  // String product;
  List<Products> productlist=[] ;
  bool isLoading = false;

  Future<void> getPost() async {
    changeLoading();
    final response = await http.get(Uri.parse('${baseUrl}/products'));
print(response.body);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body.toString());

          var p = Model.fromJson(jsonBody);
          productlist=p.products;
        break;
      default:
        showDialog(
            context: context,
            builder: (context) => Dialog(child: Text("There's no data")));
    }
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}