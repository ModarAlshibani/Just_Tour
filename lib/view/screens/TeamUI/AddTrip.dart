import 'dart:io';
import 'dart:ui';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terez/controller/Team%20Controllers/addTripController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/view/widgets/TeamUI/AddTripField.dart';
import 'package:terez/view/widgets/TeamUI/AddTripPhoto.dart';

List<String> Type = ["Tour", "Adventure", "Cultural", "Excursions", "Leisure"];
List<String> Level = ["Hard", "Medium", "Easy"];
List<String> YesOrNo = ["True", "False"];

class AddTrip extends StatefulWidget {
  const AddTrip({super.key});

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  @override
  Widget build(BuildContext context) {
    Future selectDate(TextEditingController theController) async {
      DateTime? Picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
      );
      if (Picked != null) {
        theController.text = Picked.toString().split(" ")[0];

        print(Picked.toString());
      }
    }

    Future<XFile?> getImage() async {
      final ImagePicker _picker = ImagePicker();
      XFile? image;

      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image = pickedFile;
      } else {
        print('No image selected.');
      }

      return image;
    }

    AddTripControllerImp controller = Get.put(AddTripControllerImp());

    // Future<void> pickAndSetImage() async {
    //   XFile? imageFile = await getImage();
    //   if (imageFile != null) {
    //     controller.setImageFile(imageFile);
    //     print("the image file is:");
    //     print(imageFile);
    //   }
    // }

    return Scaffold(
        body: Form(
      key: controller.formStateAddTrip,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddTripField(
              myController: controller.Title,
              initialText: "Trip Title",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            AddTripField(
              myController: controller.Location,
              initialText: "Trip Location",
              leadingIcon: Icon(Icons.location_on_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => selectDate(controller.StartDate),
                child: Text("Start date")),
            ElevatedButton(
                onPressed: () => selectDate(controller.EndDate),
                child: Text("End date")),
            ElevatedButton(
                onPressed: () => selectDate(controller.StartBooking),
                child: Text("Start Booking")),
            ElevatedButton(
                onPressed: () => selectDate(controller.EndBooking),
                child: Text("End Booking")),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value: controller.Type.text.isEmpty ? null : controller.Type.text,
              items: Type.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    controller.Type.text = newValue;
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value:
                  controller.Level.text.isEmpty ? null : controller.Level.text,
              items: Level.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    controller.Level.text = newValue;
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            AddTripField(
              myController: controller.SubLimit,
              initialText: "Maximum subscribers",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            AddTripField(
              myController: controller.Cost,
              initialText: "Cost",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            AddTripField(
              myController: controller.Description,
              initialText: "Description",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value: controller.Retrieve.text.isEmpty
                  ? null
                  : controller.Retrieve.text,
              items: YesOrNo.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    controller.Retrieve.text = newValue;
                  });
                }
              },
            ),
            AddTripField(
              myController: controller.Retrieve,
              initialText: "is retrive?",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            AddTripField(
              myController: controller.Requirements,
              initialText: "Requirements",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),

            // ElevatedButton(
            //     onPressed: () => pickAndSetImage(),
            //     child: Text("choose image")),

            AddTripField(
              myController: controller.TripPhoto,
              initialText: "Trip Photo",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => selectDate(controller.RetrieveEndDate),
                child: Text("Retrieve End Date")),
            AddTripField(
              myController: controller.RetrieveEndDate,
              initialText: "Retrieve End Date",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            AddTripField(
              myController: controller.Percent,
              initialText: "Percent",
              leadingIcon: Icon(Icons.edit),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => controller.addTrip(),
                child: Text("goooooooooooooo"))
          ],
        ),
      ),
    ));
  }
}
