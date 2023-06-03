import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebasepractice/screens/product_details.dart';

// ignore: must_be_immutable
class AllProductsView extends StatelessWidget {
  AllProductsView({super.key});
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");

  getAllProducts() async {
    return products.get();
  }

  getAllCategories() async {
    return categories.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: FutureBuilder(
                future: getAllCategories(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                "${snapshot.data.docs[index]['category']}"),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
          Center(
            child: FutureBuilder(
                future: getAllProducts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailVIew(
                                      data: snapshot.data.docs[index]),
                                ),
                              );
                            },
                            child: ListTile(
                                title: Text(
                                    "${snapshot.data.docs[index]['name']}"),
                                //title: Text(snapshot.data.docs[index]['category']),
                                subtitle: Text(
                                    "${snapshot.data.docs[index]['price']}"),
                                trailing: const Icon(Icons.delete)),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
