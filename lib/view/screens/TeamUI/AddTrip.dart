// Modar
import 'dart:ui';

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
        body: Container(
          child: Stack(
            children: [
              Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                child: Image.asset(
                  imageAsset.soil,
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 30,
              ),
              child: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  color: AppColors.whiteSmoke,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.midnightGreen,
                      size: 30,
                    )),
              ),
            ),
            Positioned(
              top: 190,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AddTripPhoto(),
                  ],
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top: 280),
                child: Container(
                  width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteSmoke,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                  child: Form(
                        key: controller.formStateAddTrip,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                AddTripField(
                                  myController: controller.Title,
                                  initialText: "Trip Title",
                                  leadingIcon: Icon(Icons.edit),
                                  ),
                                 
                                 SizedBox(height: 15,),

                                 AddTripField(
                                  myController: controller.Location,
                                  initialText: "Trip Location",
                                  leadingIcon: Icon(Icons.location_on_outlined),
                                  ),
                                  
                                  SizedBox(height: 30,),

                                 Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox( 
                                        height: 50,
                                        width: 120,
                                        child: ElevatedButton( style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.grey,
                                          shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10),
                                           ),
                                        ),
                                          onPressed: () => selectDate(controller.StartDate),
                                          child: Text("Start date",
                                          style: TextStyle(
                                            color: AppColors.blackCurrant,
                                            fontSize: 15,
                                          ),),
                                          
                                          ),
                                      ),
                                      SizedBox(width: 30,),
                                      SizedBox(
                                        height: 50,
                                        width: 120,
                                        child: ElevatedButton(
                                          onPressed: () => selectDate(controller.EndDate),
                                          child: Text("End date",
                                          style: TextStyle(
                                            color: AppColors.blackCurrant,
                                            fontSize: 15,
                                          ),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.grey,
                                            shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(10),
                                             ),
                                          ),
                                          ),
                                      ),
                                    ],
                                   ),
                                   SizedBox(height: 15,),
                                 Row( mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: ElevatedButton(
                                          onPressed: () => selectDate(controller.StartBooking),
                                          child: Text("Start Booking",
                                            style: TextStyle(
                                              color: AppColors.blackCurrant,
                                              fontSize: 15,
                                            ),),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.grey,
                                              shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(10),
                                               ),
                                            ),
                                          ),
                                      ),
                                        SizedBox(width: 30,),
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: ElevatedButton(
                                          onPressed: () => selectDate(controller.EndBooking),
                                          child: Text("End Booking",
                                            style: TextStyle(
                                              color: AppColors.blackCurrant,
                                              fontSize: 15,
                                            ),),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.grey,
                                              shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(10),
                                               ),
                                            ),
                                          ),
                                      ),
                                      ],
                                     ),
                                SizedBox(height: 20,),

                                  Row( mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DropdownButton<String>(
                                        hint: Text("Type :"),
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
                                  SizedBox(width: 50,),
                                  DropdownButton<String>(
                                    hint: Text("Level :"),
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
                                          ],
                                        ),
                                        SizedBox(height: 20,),

                                AddTripField(
                                  myController: controller.SubLimit,
                                  initialText: "Maximum subscribers",
                                  leadingIcon: Icon(Icons.groups_3_outlined),
                                            ),
                                SizedBox(height: 15,),

                                AddTripField(
                                  myController: controller.Cost,
                                  initialText: "Cost",
                                  leadingIcon: Icon(Icons.attach_money_outlined),
                                            ),
                                SizedBox(height: 15,),

                                AddTripField(
                                  myController: controller.Description,
                                  initialText: "Description",
                                  leadingIcon: Icon(Icons.edit),
                                            ),

                                SizedBox(height: 15,),

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
                                            SizedBox(height: 15,),
                                            AddTripField(
                          myController: controller.Requirements,
                          initialText: "Requirements",
                          leadingIcon: Icon(Icons.edit),
                                            ),
                                            SizedBox(height: 10,),
                                        
                                            // ElevatedButton(
                                            //     onPressed: () => pickAndSetImage(),
                                            //     child: Text("choose image")),
                                        
                                            AddTripField(
                          myController: controller.TripPhoto,
                          initialText: "Trip Photo",
                          leadingIcon: Icon(Icons.edit),
                                            ),
                                            SizedBox(height: 20,),
                                            
                                            SizedBox(
                                              height: 50,
                                        width: 170,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.grey,
                                                shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(10),
                                                 ),
                                              ),
                                                                          onPressed: () => selectDate(controller.RetrieveEndDate),
                                                                          child: Text("Retrieve End Date",
                                                                          style: TextStyle(
                                                color: AppColors.blackCurrant,
                                                fontSize: 15,
                                              ),),),
                                            ),
                        SizedBox(height: 15,),
                       AddTripField(
                          myController: controller.RetrieveEndDate,
                          initialText: "Retrieve End Date",
                          leadingIcon: Icon(Icons.edit),
                                            ),
                                            SizedBox(height: 15,),
                                            
                       AddTripField(
                          myController: controller.Percent,
                          initialText: "Percent",
                          leadingIcon: Icon(Icons.percent),
                                            ),
                       SizedBox(height: 25,),

                                            SizedBox(
                                              height: 50,
                                              width: 150,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.orange,
                                                shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(10),
                                                 ),
                                              ),
                                              onPressed: () => controller.AddTrip(),
                                              child: Text("Add the Trip",
                                              style: TextStyle(
                                                color: AppColors.whiteSmoke,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600
                                              ),),
                                                                          ),
                                            )
                                          ],
                                        ),
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ));
  }
}
