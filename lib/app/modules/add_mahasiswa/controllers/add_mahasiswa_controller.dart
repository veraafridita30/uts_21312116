import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNPM;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProdi;
  late TextEditingController cJenisKelamin;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addMahasiswa(
      String npm, String nama, String alamat, String prodi, String jenisKelamin) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");
    try {
      await mahasiswa.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "prodi": prodi,
        "jenisKelamin": jenisKelamin,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        onConfirm: () {
          cNPM.clear();
          cNama.clear();
          cAlamat.clear();
          cProdi.clear();
          cJenisKelamin.clear();
          Get.back();
          Get.back();
          textConfirm: "OK";
        },
      );
    } catch (e) {
      // Handle error jika diperlukan
    }
  }

  @override
  void onInit() {
    cNPM = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cProdi = TextEditingController();
    cJenisKelamin = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProdi.dispose();
    cJenisKelamin.dispose();
    super.onClose();
  }
}
