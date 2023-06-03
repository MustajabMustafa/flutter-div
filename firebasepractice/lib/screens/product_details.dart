import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailVIew extends StatelessWidget {
  var data;
  ProductDetailVIew({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("${data['name']}"),
      ),
    );
  }
}
