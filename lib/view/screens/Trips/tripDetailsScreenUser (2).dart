import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/controller/Trips%20Controller/joinTripController%20(2).dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/core/constant/appColors.dart';

import 'package:terez/data/model/trip_model.dart';
import 'package:terez/view/screens/Trips/EnrollementScreen%20(2).dart';
import 'package:terez/view/widgets/Trips/tripDetails/Description.dart';
import 'package:terez/view/widgets/Trips/tripDetails/EnrollBar.dart';
import 'package:terez/view/widgets/Trips/tripDetails/mainInfoRow.dart';
import 'package:terez/view/widgets/Trips/tripDetails/tripDetailsPic.dart';
import '../../../controller/Trips Controller/showTripsController.dart';

class TripDetailsScreenUser extends StatefulWidget {
  final int? id;

  const TripDetailsScreenUser({super.key, this.id});

  @override
  State<TripDetailsScreenUser> createState() => _TripDetailsScreenUserState();
}

late Future<TripModel?> trip;

class _TripDetailsScreenUserState extends State<TripDetailsScreenUser> {
  @override
  void initState() {
    trip = TripController().userGetTripDetails(widget.id);
    // isReserved = TripController().ReservationStatus(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    JoinTripControllerImp controller = Get.put(JoinTripControllerImp());
    trip = TripController().userGetTripDetails(widget.id);
    // isReserved = TripController().ReservationStatus(widget.id);

    print(
        "================================================================================");
    print(widget.id);
    if (Get.find<GlobalStateController>().getTripIsReserved() == true) {
      print('gettttttttttttttttttttttttttttttttttttttttttttttt true');
    } else {
      print('gettttttttttttttttttttttttttttttttttttttttttttttt false');
    }

    print(
        "================================================================================");
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
      color: Get.find<GlobalStateController>().getTripIsReserved()
          ? AppColors.orange
          : AppColors.grey,
      child: Stack(
        children: [
          Container(
            height: 770,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55))),
            child: Column(
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
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: Get.find<GlobalStateController>().getTripIsReserved()
                    ? AppColors.orange
                    : AppColors.grey,
                width: 400,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Get.find<GlobalStateController>()
                                    .getTripIsReserved()
                                ? "Trip Reserved"
                                : "Total price",
                            style: TextStyle(
                                color: AppColors.blackCurrant.withOpacity(0.6),
                                fontSize: 15),
                          ),
                          Text(
                            Get.find<GlobalStateController>()
                                    .getTripIsReserved()
                                ? "Cancel Reservation"
                                : tripInfo.data!.Cost.toString() + "S.p",
                            style: TextStyle(
                                color: AppColors.blackCurrant,
                                fontSize: 22,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    InkWell(
                      onTap: () {
                        if (Get.find<GlobalStateController>()
                                .getTripIsReserved() ==
                            false) {
                          Get.to(
                              EnrollementScreen(
                                id: tripInfo.data!.id,
                              ),
                              arguments: tripInfo.data!.id);
                        } else if (Get.find<GlobalStateController>()
                                .getTripIsReserved() ==
                            true) {
                          JoinTripControllerImp()
                              .CancelReservation(tripInfo.data!.id);
                          print("Cancelllllllllllllllllllll TRip");
                        }
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: AppColors.blackCurrant,
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Get.find<GlobalStateController>().getTripIsReserved()
                              ? Icons.cancel_outlined
                              : Icons.arrow_forward_rounded,
                          color: AppColors.whiteSmoke.withOpacity(0.8),
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
