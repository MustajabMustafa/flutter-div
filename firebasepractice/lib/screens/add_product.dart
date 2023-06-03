import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  AddProductView({super.key});
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  addProduct(context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection("products");
    products
        .add({"name": productName.text, "price": productPrice.text})
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product Added"))))
        .catchError((e) => print(e));
    productName.text = "";
    productPrice.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product Name',
                ),
                controller: productName,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Product Price',
                ),
                controller: productPrice,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addProduct(context);
                },
                child: const Text("Add Product"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
