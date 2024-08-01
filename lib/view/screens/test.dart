import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/controller/showTripsController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/data/model/trip_model.dart';
import 'package:terez/view/screens/test2.dart';
import 'package:terez/view/widgets/Trips/tripOutsideVertical.dart';
import 'Trips/TripDetailScreen.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

late Future<List<TripModel>?> trips;

@override
void initState() {
  trips = TripController().getTrips();
  // super.initState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    trips = TripController().getTrips();
    return Scaffold(
      body: FutureBuilder<List<TripModel>?>(
        future: trips,
        builder: (context, tripInfo) {
          if (tripInfo.hasData) {
            return buildGridView(tripInfo);
          } else if (tripInfo.hasError) {
            return Text('${tripInfo.error}');
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buildGridView(AsyncSnapshot<List<TripModel>?> tripInfo) =>
    GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        TripModel trip = tripInfo.data![index];

        return InkWell(
          onTap: () => Get.to(
              () => Test2(
                    tripId: trip.id,
                  ),
              arguments: trip.id),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.midnightGreen.withOpacity(0.3)),
            width: 170,
            height: 220,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  width: 170,
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/e8/2b/e4/e82be4f7f891766ec7c0b0230cb292f4.jpg'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                )),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              AppColors.blackCurrant.withOpacity(0.9),
                              AppColors.blackCurrant.withOpacity(0.6),
                              AppColors.blackCurrant.withOpacity(0.3),
                              AppColors.blackCurrant.withOpacity(0),
                              AppColors.blackCurrant.withOpacity(0),
                              AppColors.blackCurrant.withOpacity(0),
                            ])),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.blackCurrant.withOpacity(0.9),
                              AppColors.blackCurrant.withOpacity(0.7),
                              AppColors.blackCurrant.withOpacity(0),
                              AppColors.blackCurrant.withOpacity(0),
                              AppColors.blackCurrant.withOpacity(0),
                              AppColors.blackCurrant.withOpacity(0),
                              AppColors.blackCurrant.withOpacity(0),
                            ])),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 15,
                  child: Container(
                    width: 150,
                    child: Text(
                      trip.Title!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 40,
                  child: Text(
                    trip.TeamName!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontSize: 14, color: AppColors.paleGold),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 60,
                  child: Text(
                    trip.StartDate!.day.toString() +
                        "/" +
                        trip.StartDate!.month.toString() +
                        "/" +
                        trip.StartDate!.year.toString(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: Text(
                    trip.Cost.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },

      scrollDirection: Axis.vertical,
      itemCount: tripInfo.data!.length,
      // card.lenght
      //itemCount: destinations.length,
    );
