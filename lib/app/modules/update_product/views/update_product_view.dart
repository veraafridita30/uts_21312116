import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Nama Product"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cHarga,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Harga Product"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: ()=> controller.updateProduct(
                controller.cNama.text,
                controller.cHarga.text,
                Get.arguments
              ), 
              child: Text("Ubah")
              ),
          ],
        ),
        );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}