import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/controller/Team%20Controllers/addTripController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/view/widgets/TeamUI/AddTripField.dart';
import 'package:terez/view/widgets/TeamUI/AddTripPhoto.dart';

class AddTrips extends StatefulWidget {
  @override
  State<AddTrips> createState() => _AddTripsState();
}

class _AddTripsState extends State<AddTrips> {
  var TripType;
  var TripLevel;
  var isRetrievable;
  List<String> Type = [
    "Tour",
    "Adventure",
    "Cultural",
    "Excursions",
    "Leisure"
  ];
  List<String> Level = ["Hard", "Medium", "Easy"];
  List<String> YesOrNo = ["true", "false"];

  TextEditingController dateController = TextEditingController();
  TextEditingController dateController1 = TextEditingController();

  Future selectDate(TextEditingController dateController) async {
    DateTime? Picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (Picked != null) {
      setState(() {
        dateController.text = Picked.toString().split(" ")[0];
      });
    }
  }

  Widget build(BuildContext context) {
    AddTripControllerImp controller = Get.put(AddTripControllerImp());
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
                child: AddTripPhoto(),
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
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        AddTripField(
                          initialText: "Trip Name",
                          leadingIcon: Icon(Icons.edit),
                          myController: controller.Title,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddTripField(
                          initialText: "Trip Location",
                          leadingIcon: Icon(Icons.location_on_outlined),
                          myController: controller.Location,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 142,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  hint: Text("Trip Type: "),
                                  value: TripType,
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        TripType = newValue;
                                        controller.Type.text = newValue;
                                      });
                                    }
                                  },
                                  items: Type.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 142,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  hint: Text("Trip Level: "),
                                  value: TripLevel,
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        TripLevel = newValue;
                                        controller.Level.text = newValue;
                                      });
                                    }
                                  },
                                  items: Level.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddTripField(
                          initialText: "Description: ",
                          leadingIcon: Icon(Icons.info_rounded),
                          myController: controller.Description,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddTripField(
                          initialText: "Requirements: ",
                          leadingIcon: Icon(Icons.info_rounded),
                          myController: controller.Requirements,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddTripField(
                          initialText: "Maximum Members",
                          leadingIcon: Icon(Icons.person_outlined),
                          myController: controller.SubLimit,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddTripField(
                          initialText: "Cost: ",
                          leadingIcon: Icon(Icons.attach_money),
                          myController: controller.Cost,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 142,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  hint: Text("Retriveable? "),
                                  value: isRetrievable,
                                  onChanged: (newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        isRetrievable = newValue;
                                        controller.Retrieve.text = newValue;
                                      });
                                    }
                                  },
                                  items: YesOrNo.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 142,
                              child: TextField(
                                controller: controller.RetrieveEndDate,
                                decoration: InputDecoration(
                                  labelText: "Last date",
                                  labelStyle: TextStyle(fontSize: 14),
                                  prefixIconColor: AppColors.midnightGreen,
                                  filled: true,
                                  fillColor: AppColors.grey,
                                  prefixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  selectDate(controller.RetrieveEndDate);
                                },
                              ),
                            ),
                          ],
                        ),
                        AddTripField(
                          initialText: "Retrive Percent",
                          leadingIcon: Icon(Icons.percent),
                          myController: controller.Percent,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 142,
                              child: TextField(
                                controller: controller.StartDate,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: AppColors.grey, width: 4)),
                                  labelText: "Start Date",
                                  labelStyle: TextStyle(fontSize: 14),
                                  prefixIconColor: AppColors.midnightGreen,
                                  filled: true,
                                  fillColor: AppColors.grey,
                                  prefixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  selectDate(controller.StartDate);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 142,
                              child: TextField(
                                controller: controller.EndDate,
                                decoration: InputDecoration(
                                    labelText: "End Date",
                                    labelStyle: TextStyle(fontSize: 14),
                                    prefixIconColor: AppColors.midnightGreen,
                                    filled: true,
                                    fillColor: AppColors.grey,
                                    prefixIcon: Icon(
                                      Icons.calendar_month_outlined,
                                    )),
                                readOnly: true,
                                onTap: () {
                                  selectDate(controller.EndDate);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 142,
                              child: TextField(
                                controller: controller.StartBooking,
                                decoration: InputDecoration(
                                  labelText: "Start Booking",
                                  labelStyle: TextStyle(fontSize: 14),
                                  prefixIconColor: AppColors.midnightGreen,
                                  filled: true,
                                  fillColor: AppColors.grey,
                                  prefixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                  ),
                                ),
                                readOnly: true,
                                onTap: () {
                                  selectDate(controller.StartBooking);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 142,
                              child: TextField(
                                controller: controller.EndBooking,
                                decoration: InputDecoration(
                                    labelText: "End Booking",
                                    labelStyle: TextStyle(fontSize: 14),
                                    prefixIconColor: AppColors.midnightGreen,
                                    filled: true,
                                    fillColor: AppColors.grey,
                                    prefixIcon: Icon(
                                      Icons.calendar_month_outlined,
                                    )),
                                readOnly: true,
                                onTap: () {
                                  selectDate(controller.EndBooking);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddTripField(
                          initialText: "Paste a photo link here",
                          leadingIcon: Icon(Icons.photo),
                          myController: controller.TripPhoto,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          onPressed: () => controller.AddTrip(),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.orange),
                            child: Center(
                              child: Text(
                                "Add Trip",
                                style: TextStyle(
                                  color: AppColors.whiteSmoke,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
