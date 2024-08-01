import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/Trips/AllTrips.dart';
import 'package:terez/view/screens/Trips/TripDetailScreen.dart';
import 'package:terez/view/widgets/Trips/tripOutsideVertical.dart';

// ignore: must_be_immutable
class TripsCat extends StatelessWidget {
  final String? background;
  final String? tripsCat;
  final Color? catColor;
  TripsCat({super.key, this.background, this.tripsCat, this.catColor});

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final tripsFilteredByCat =
        tripsList.where((trip) => trip.Type == "$tripsCat").toList();

    return Stack(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Positioned(
              left: 20,
              top: 11,
              child: Text(
                "$tripsCat trips",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Color.fromARGB(255, 63, 63, 63), fontSize: 26),
              ),
            ),
            Positioned(
              right: 25,
              top: 10,
              child: InkWell(
                onTap: () => Get.to(AllTrips(
                  Category: tripsCat,
                )),
                child: Container(
                  width: 85,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.midnightGreen,
                  ),
                  child: Center(
                    child: Text(
                      "See all...",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.whiteSmoke, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 50,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            height: 240,

            width: 82 * 5, // Use the adjusted width
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: tripsFilteredByCat.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.to(TripDetailScreen(
                      id: tripsFilteredByCat[index].id,
                      Location: tripsFilteredByCat[index].Location,
                      Type: tripsFilteredByCat[index].Type,
                      Title: tripsFilteredByCat[index].Title,
                      TripPhoto: tripsFilteredByCat[index].TripPhoto,
                      StartDate: tripsFilteredByCat[index].StartDate,
                      EndDate: tripsFilteredByCat[index].EndDate,
                      StartBooking: tripsFilteredByCat[index].StartBooking,
                      EndBooking: tripsFilteredByCat[index].EndBooking,
                      Level: tripsFilteredByCat[index].Level,
                      Cost: tripsFilteredByCat[index].Cost,
                      Retrieve: tripsFilteredByCat[index].Retrieve,
                      TeamName: tripsFilteredByCat[index].TeamName,
                      Description: tripsFilteredByCat[index].Description,
                      Sublimit: tripsFilteredByCat[index].SubLimit,
                    )),
                    child: TripOutSide(
                      name: tripsFilteredByCat[index].Title,
                      date: tripsFilteredByCat[index].StartDate,
                      pic: tripsFilteredByCat[index].TripPhoto,
                      price: tripsFilteredByCat[index].Cost,
                      team: tripsFilteredByCat[index].team_id,
                      discreption: tripsFilteredByCat[index].Description,
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
