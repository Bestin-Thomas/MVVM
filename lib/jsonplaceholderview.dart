import 'package:flutter/cupertino.dart' as jsonplaceholderview;
import 'package:flutter/material.dart';

import 'json_place_holder_viewModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'json_place_holder_viewModel.dart';


class JsonPlaceHolderView extends JsonPlaceHolderViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
            : Text("Jsonplaceholder"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => getPost()),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
            itemCount: productlist.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(productlist[index].title.toString()),
                subtitle: Text(productlist[index].description.toString()),
                leading: Text(productlist[index].id.toString()),
              ),
            )),
      ),
    );
  }
}
// ListView.builder(
// itemCount:productlist.length??0,
// itemBuilder: (context, index) {
// print(productlist.length.toString());
// return Card(
// child: ListTile(
// title: Text(productlist[index].title.toString()),
// subtitle: Text(productlist[index].description.toString()),
// // leading: CircleAvatar(
// //   backgroundImage: NetworkImage(
// //       "${products[index].images[0]}"),
// //   radius: 30,
// // ),
// ),
// );
// }),