import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class UpdateMahasiswaView extends GetView<UpdateMahasiswaController> {
  const UpdateMahasiswaView({Key? key}) : super(key: key);
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
                    controller: controller.cNPM,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "NPM Mahasiswa"),
                    // Isi dengan data npm dari snapshot jika diperlukan
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cNama,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Nama Mahasiswa"),
                    // Isi dengan data nama dari snapshot jika diperlukan
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cAlamat,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Alamat Mahasiswa"),
                    // Isi dengan data alamat dari snapshot jika diperlukan
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cProdi,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Program Studi Mahasiswa"),
                    // Isi dengan data prodi dari snapshot jika diperlukan
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cJenisKelamin,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Jenis Kelamin Mahasiswa"),
                    // Isi dengan data jenis kelamin dari snapshot jika diperlukan
                  ),
                  SizedBox(
                    height: 30,
                  ),
            ElevatedButton(
                    onPressed: () => controller.updateMahasiswa(
                      controller.cNPM.text,
                      controller.cNama.text,
                      controller.cAlamat.text,
                      controller.cProdi.text,
                      controller.cJenisKelamin.text,
                      Get.arguments,
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