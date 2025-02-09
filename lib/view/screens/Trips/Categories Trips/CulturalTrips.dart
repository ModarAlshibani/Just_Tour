import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/controller/Trips%20Controller/showTripsController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/model/team_model.dart';
import 'package:terez/data/model/trip_model.dart';
import 'package:terez/view/screens/Trips/tripDetailsScreenUser%20(2).dart';

class CulturalTrips extends StatelessWidget {
  const CulturalTrips({super.key});

  @override
  Widget build(BuildContext context) {
    culturalTrips = TripController().getTrips("cultural");
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.midnightGreen,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60,
                left: 30,
              ),
              child: Text(
                "Cultural Trips",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: AlignmentDirectional.topStart,
              decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 188, 188, 188),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 30),
                child: ElevatedButton(
                  onPressed: () {
                    // Get.to(SearchScreen());
                    null;
                  },
                  child: const Icon(
                    Icons.search,
                    size: 30,
                    color: AppColors.varidiantGreen,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteSmoke,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 180,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteSmoke,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: FutureBuilder<List<TripModel>?>(
                  future: culturalTrips,
                  builder: (context, tripInfo) {
                    if (tripInfo.hasData) {
                      return getCategorieTrips(tripInfo);
                    } else if (tripInfo.hasError) {
                      return Text('${tripInfo.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

late Future<List<TripModel>?> culturalTrips;

Widget getCategorieTrips(AsyncSnapshot<List<TripModel>?> tripInfo) =>
    ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tripInfo.data?.length ?? 0,
      scrollDirection: Axis.vertical,

      itemBuilder: (BuildContext context, int index) {
        TripModel trip = tripInfo.data![index];
        String? pic = trip.TripPhoto;
        return InkWell(
          onTap: () {
            //   TripController().userGetTripDetails(trip.id);
            Get.to(
              () => TripDetailsScreenUser(
                id: trip.id,
              ),
              arguments: trip,
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.midnightGreen.withOpacity(0.3)),
            width: 320,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  width: 320,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pic!), fit: BoxFit.cover),
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
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      trip.Title!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 40,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      trip.TeamName!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        color: AppColors.paleGold,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 60,
                  child: Text(
                    "${trip.StartDate!.day}/${trip.StartDate!.month}/${trip.StartDate!.year}",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: Text(
                    "${trip.Cost} S.p",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },

      // card.lenght
      //itemCount: destinations.length,
    );
