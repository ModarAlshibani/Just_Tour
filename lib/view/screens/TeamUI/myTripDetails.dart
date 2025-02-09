import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Trips%20Controller/joinTripController%20(2).dart';
import 'package:JustTour/controller/Trips%20Controller/showTeamMyTripsController.dart';
import 'package:JustTour/core/constant/appColors.dart';

import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/TeamUI/countestantsScreen.dart';
import 'package:JustTour/view/widgets/Trips/tripDetails/Description.dart';
import 'package:JustTour/view/widgets/Trips/tripDetails/mainInfoRow.dart';
import 'package:JustTour/view/widgets/Trips/tripDetails/tripDetailsPic.dart';

class MyTripDetails extends StatefulWidget {
  final int? id;

  const MyTripDetails({super.key, this.id});

  @override
  State<MyTripDetails> createState() => _MyTripDetails();
}

late Future<TripModel?> trip;

class _MyTripDetails extends State<MyTripDetails> {
  @override
  void initState() {
    trip = TeamMyTripsController().teamGetTripDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    JoinTripControllerImp controller = Get.put(JoinTripControllerImp());
    trip = TeamMyTripsController().teamGetTripDetails(widget.id);

    return Scaffold(
        // backgroundColor: AppColors.grey,
        body: FutureBuilder<TripModel?>(
      future: trip,
      builder: (context, tripInfo) {
        if (tripInfo.hasData) {
          return getTripDetails(tripInfo);
        } else if (tripInfo.hasError) {
          return Text(' ${tripInfo.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

Widget getTripDetails(AsyncSnapshot<TripModel?> tripInfo) => Container(
      height: double.infinity,
      color: AppColors.grey,
      child: Stack(
        children: [
          Container(
            height: 770,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55))),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TripDetailsPic(
                      coverPic: tripInfo.data?.TripPhoto,
                      title: tripInfo.data?.Title,
                      place: tripInfo.data?.Location),
                  SizedBox(
                    height: 20,
                  ),
                  MainInfoRow(
                      teamName: tripInfo.data?.TeamName,
                      type: tripInfo.data?.Type,
                      level: tripInfo.data?.Level,
                      startDate: tripInfo.data?.StartDate,
                      endDate: tripInfo.data?.EndDate),
                  SizedBox(
                    height: 20,
                  ),
                  DescriptionText(description: tripInfo.data?.Description),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Total price:",
                        style: TextStyle(
                            color: AppColors.blackCurrant,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        tripInfo.data!.Cost.toString() + "S.p",
                        style: TextStyle(
                            color: AppColors.blackCurrant.withOpacity(0.6),
                            fontSize: 15,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: AppColors.grey,
                width: 400,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    Container(
                      child: Text(
                        "Display Countestants :",
                        style: TextStyle(
                            color: AppColors.blackCurrant,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    InkWell(
                      onTap: () {
                        Get.to(
                            CountestantsScreen(
                              id: tripInfo.data!.id,
                            ),
                            arguments: tripInfo.data!.id);
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: AppColors.blackCurrant,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.whiteSmoke.withOpacity(0.8),
                          size: 60,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0,
                    )
                  ],
                ),
              )),
        ],
      ),
    );
