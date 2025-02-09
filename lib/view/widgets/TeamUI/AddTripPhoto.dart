import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';
import '../../../controller/Team Controllers/addTripController.dart';

class AddTripPhoto extends StatefulWidget {
  const AddTripPhoto({super.key});

  @override
  State<AddTripPhoto> createState() => _AddTripPhotoState();
}

class _AddTripPhotoState extends State<AddTripPhoto> {
  Uint8List? tripPhoto;
  AddTripControllerImp controller = Get.find();

  void selectImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? img = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (img != null) controller.TripPhoto = File(img.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return tripPhoto != null
        ? Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: AppColors.whiteSmoke,
              image: DecorationImage(
                image: MemoryImage(tripPhoto!),
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.midnightGreen,
                  offset: Offset(0.0, 0.1),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: selectImage,
              child: Container(),
            ),
          )
        : Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: AppColors.whiteSmoke,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.midnightGreen,
                  offset: Offset(0.0, 0.1),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: MaterialButton(
              onPressed: selectImage,
              child: Container(
                child: Icon(
                  Icons.add,
                  color: AppColors.midnightGreen,
                  size: 35,
                ),
              ),
            ),
          );
  }
}
