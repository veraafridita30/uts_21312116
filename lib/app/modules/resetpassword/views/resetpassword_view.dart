import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  final cEmail = TextEditingController();
  final cPass = TextEditingController();
  final cAuth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResetpasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ResetpasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
