import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomepageLoadingWidget extends StatelessWidget {
  const HomepageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey[350]!, 
              highlightColor: Colors.white,
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),
              ), 
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[350]!, 
              highlightColor: Colors.white,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),
              ), 
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[350]!, 
              highlightColor: Colors.white,
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),
              ), 
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[350]!, 
              highlightColor: Colors.white,
              child: Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),
              ), 
            ),
            const SizedBox(height: 30),
            Shimmer.fromColors(
              baseColor: Colors.grey[350]!, 
              highlightColor: Colors.white,
              child: Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),
              ), 
            ),
            const SizedBox(height: 15),
            Shimmer.fromColors(
              baseColor: Colors.grey[350]!, 
              highlightColor: Colors.white,
              child: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]
                ),
              ), 
            ),
            const SizedBox(height: 35),
      
          ],
        ),
      ),
    );
  }
}