import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/controller/Trips%20Controller/showTripsController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/data/model/trip_model.dart';
import 'package:terez/view/screens/Trips/Categories%20Trips/AdventureTrips.dart';
import 'package:terez/view/screens/Trips/Categories%20Trips/CulturalTrips.dart';
import 'package:terez/view/screens/Trips/Categories%20Trips/ExcursionsTrips.dart';
import 'package:terez/view/screens/Trips/Categories%20Trips/LeisureTrips.dart';
import 'package:terez/view/screens/Trips/Categories%20Trips/TourTrips.dart';
import 'package:terez/view/screens/Trips/tripDetailsScreenUser%20(2).dart';
import 'package:terez/view/screens/navbar.dart';
import 'package:terez/view/widgets/Trips/tripOutsideVertical.dart';
import 'package:terez/view/widgets/Trips/tripsCatTitle.dart';

class AllTrips extends StatelessWidget {
  const AllTrips({super.key});

  @override
  Widget build(BuildContext context) {
    tourTrips = TripController().getTrips("tour");
    adventureTrips = TripController().getTrips("adventure");
    culturalTrips = TripController().getTrips("cultural");
    excursionsTrips = TripController().getTrips("excursions");
    leisureTrips = TripController().getTrips("leisure");

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/nav');
        return false;
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            print("in refressssssssssssssssssssssssssssssssssssh");
      
            // Get.to(Navbar());
            await Future.delayed(Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategorieName(catName: "Tour Trips:"),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          color: AppColors.midnightGreen,
                          onPressed: () => Get.to(TourTrips()),
                          child: Text(
                            "See More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 270,
                  child: FutureBuilder<List<TripModel>?>(
                    future: tourTrips,
                    builder: (context, tripInfo) {
                      if (tripInfo.hasData) {
                        return getCategorieTrips(tripInfo);
                      } else if (tripInfo.hasError) {
                        return Text('${tripInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategorieName(catName: "Cultural Trips:"),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          color: AppColors.midnightGreen,
                          onPressed: () => Get.to(CulturalTrips()),
                          child: Text(
                            "See More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 270,
                  child: FutureBuilder<List<TripModel>?>(
                    future: culturalTrips,
                    builder: (context, tripInfo) {
                      if (tripInfo.hasData) {
                        return getCategorieTrips(tripInfo);
                      } else if (tripInfo.hasError) {
                        return Text(' ${tripInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategorieName(catName: "Leisure Trips:"),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          color: AppColors.midnightGreen,
                          onPressed: () => Get.to(LeisureTrips()),
                          child: Text(
                            "See More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 270,
                  child: FutureBuilder<List<TripModel>?>(
                    future: leisureTrips,
                    builder: (context, tripInfo) {
                      if (tripInfo.hasData) {
                        return getCategorieTrips(tripInfo);
                      } else if (tripInfo.hasError) {
                        return Text(' ${tripInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategorieName(catName: "Adventure Trips:"),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          color: AppColors.midnightGreen,
                          onPressed: () => Get.to(AdventureTrips()),
                          child: Text(
                            "See More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 270,
                  child: FutureBuilder<List<TripModel>?>(
                    future: adventureTrips,
                    builder: (context, tripInfo) {
                      if (tripInfo.hasData) {
                        return getCategorieTrips(tripInfo);
                      } else if (tripInfo.hasError) {
                        return Text('${tripInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CategorieName(catName: "Excursions Trips:"),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          color: AppColors.midnightGreen,
                          onPressed: () => Get.to(ExcursionsTrips()),
                          child: Text(
                            "See More",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 270,
                  child: FutureBuilder<List<TripModel>?>(
                    future: excursionsTrips,
                    builder: (context, tripInfo) {
                      if (tripInfo.hasData) {
                        return getCategorieTrips(tripInfo);
                      } else if (tripInfo.hasError) {
                        return Text(' ${tripInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

late Future<List<TripModel>?> tourTrips;
late Future<List<TripModel>?> adventureTrips;
late Future<List<TripModel>?> culturalTrips;
late Future<List<TripModel>?> excursionsTrips;
late Future<List<TripModel>?> leisureTrips;

@override
void initState() {
  tourTrips = TripController().getTrips("tour");
  adventureTrips = TripController().getTrips("adventure");
  culturalTrips = TripController().getTrips("culture");
  excursionsTrips = TripController().getTrips("excursions");
  leisureTrips = TripController().getTrips("leisure");
}

Widget getCategorieTrips(AsyncSnapshot<List<TripModel>?> tripInfo) =>
    ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tripInfo.data?.length ?? 0,
      scrollDirection: Axis.horizontal,

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
            width: 170,
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  width: 170,
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pic!), fit: BoxFit.fill),
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
