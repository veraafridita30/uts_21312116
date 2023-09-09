import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateMahasiswaController extends GetxController {
  late TextEditingController cNPM;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProdi;
  late TextEditingController cJenisKelamin;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateMahasiswa(
      String npm, String nama, String alamat, String prodi, String jenisKelamin, String id) async {
    DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);

    try {
      await mahasiswaById.update({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "prodi": prodi,
        "jenisKelamin": jenisKelamin,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data mahasiswa.",
        onConfirm: () {
          cNPM.clear();
          cNama.clear();
          cAlamat.clear();
          cProdi.clear();
          cJenisKelamin.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal mengubah data mahasiswa.",
      );
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
