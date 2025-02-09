import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/controller/Trips%20Controller/joinTripController%20(2).dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/widgets/Trips/enrollement/EnrolllementTextField%20(2).dart';

class EnrollementScreen extends StatefulWidget {
  final int? id;
  const EnrollementScreen({super.key, this.id});

  @override
  State<EnrollementScreen> createState() => _EnrollementScreenState();
}

class _EnrollementScreenState extends State<EnrollementScreen> {
  @override
  Widget build(BuildContext context) {
    JoinTripControllerImp controller = Get.put(JoinTripControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Enrollement info"),
      ),
      body: Form(
        key: controller.formStateJoin,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            EnrollementTextField(
              label: "number of people",
              hint: "number of people you want to reserve for?",
              icon: Icon(Icons.people_outline),
              myController: controller.Count,
              valid: null,
            ),
            SizedBox(
              height: 20,
            ),
            EnrollementTextField(
              label: "Names",
              hint: "All the names separated with ',' ",
              icon: Icon(Icons.book_online_outlined),
              myController: controller.names,
              valid: null,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                "Your Enrollement will cost:",
                style: TextStyle(
                    color: AppColors.blackCurrant,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "190000" + " S.p",
                style: TextStyle(
                    color: AppColors.blackCurrant,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.reserve(widget.id!);
                },
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(child: Text("Enroll")),
                ))
          ],
        ),
      ),
    );
  }
}
