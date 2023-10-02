import 'package:faizal_mobile_dev/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialog401 extends StatelessWidget {
  const AlertDialog401({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/image/maintenance.png",),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 45,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: fancyBlue
              ),
              child: const Text("Back", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}