import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/view/widgets/Trips/TripsCat.dart';

class Trips extends StatelessWidget {
  const Trips({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
            )),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3.0, sigmaY: 3.0), // Adjust the blur intensity
              child: Container(
                color: Colors.black.withOpacity(0.0), // Use a transparent color
              ),
            ),
            Column(
              children: [
                TripsCat(
                  background: imageAsset.camping,
                  tripsCat: "Tour",
                  catColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(
                  height: 10,
                ),
                TripsCat(
                  background: imageAsset.hiking,
                  tripsCat: "Hiking",
                  catColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(
                  height: 10,
                ),
                TripsCat(
                  background: imageAsset.hiking,
                  tripsCat: "Cultural",
                  catColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
