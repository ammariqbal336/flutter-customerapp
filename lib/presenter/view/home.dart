import 'package:customer_app/presenter/controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {

  final _controller = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_controller.isDeviceConnected.value ? "Connected": "Disconnected")
          ],
        ),
      ))  
    );
  }
}