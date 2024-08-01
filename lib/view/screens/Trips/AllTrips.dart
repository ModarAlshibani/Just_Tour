import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/Trips/TripDetailScreen.dart';
import 'package:terez/view/widgets/Trips/tripOutsideVertical.dart';

// enum Type {
//   Camping, Hiking, Cultural
// }
class AllTrips extends StatelessWidget {
  final String? Category;
  const AllTrips({super.key, this.Category});

  @override
  Widget build(BuildContext context) {
    final tripsFilteredByCat =
        tripsList.where((trip) => trip.Type == Category).toList();
    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.midnightGreen,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 60,
                    left: 30,
                  ),
                ),
              ),
              Container(
                color: AppColors.blackCurrant.withOpacity(0.6),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Text(
                  "$Category trips",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: AlignmentDirectional.topStart,
                  decoration: const BoxDecoration(
                    color: AppColors.grey,
                    // image: DecorationImage(
                    //     image: AssetImage(imageAsset.soil), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 120),
                color: AppColors.blackCurrant.withOpacity(0.1),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: AlignmentDirectional.topStart,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 180),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
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
                        //pics: tripsFilteredByCat[index].pics,
                        Sublimit: tripsFilteredByCat[index].SubLimit,
                      )),
                      child: TripOutSide(
                        name: tripsFilteredByCat[index].Title,
                        date: tripsFilteredByCat[index].StartDate,
                        pic: tripsFilteredByCat[index].TripPhoto,
                        price: tripsFilteredByCat[index].Cost,
                        team: tripsFilteredByCat[index].TeamName,
                        discreption: tripsFilteredByCat[index].Description,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
