import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/APIs.dart';
import '../../controller/showTripsController.dart';

class Test2 extends StatelessWidget {
  final int? tripId;
  const Test2({super.key, this.tripId});

  @override
  Widget build(BuildContext context) {
    print(tripId);
    print(tripId);
    print(tripId);
    print(tripId);

    return Scaffold(
      body: Container(width: 400, height: 800, color: Colors.amber),
    );
  }
}
