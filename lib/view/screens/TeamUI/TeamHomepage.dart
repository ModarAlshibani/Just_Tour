import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Sites%20Controller/showAllSitesController.dart';
import 'package:JustTour/controller/Trips%20Controller/showTeamMyTripsController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/place_model.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/Places/placeDetails.dart';
import 'package:JustTour/view/screens/TeamUI/myTripDetails.dart';
import 'package:JustTour/view/widgets/TeamUI/placesList.dart';
import 'package:JustTour/view/screens/TeamUI/AddTripsMe.dart';
import 'package:JustTour/view/widgets/TeamUI/teamDrawer.dart';

class TeamHomepage extends StatefulWidget {
  @override
  State<TeamHomepage> createState() => _TeamHomepageState();
}

late Future<List<TripModel>?> trips;
late Future<List<PlaceModel>?> sites;

@override
void initState() {
  trips = TeamMyTripsController().getMyTrips();
  sites = ShowSitesController().teamgetSites();
}

class _TeamHomepageState extends State<TeamHomepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    trips = TeamMyTripsController().getMyTrips();
    sites = ShowSitesController().teamgetSites();

    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.grey,
            title: const Text('Exit App'),
            content: const Text(
              'Are you sure you want to exit the app?',
              style: TextStyle(color: AppColors.blackCurrant),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'No',
                  style: TextStyle(color: AppColors.blackCurrant),
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: const Text(
                  'Yes',
                  style: TextStyle(color: AppColors.blackCurrant),
                ),
                onPressed: () => SystemNavigator.pop(),
              ),
            ],
          ),
        );
        return result == true;
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: new TeamDrawer(),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.midnightGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 40,
                          color: AppColors.grey,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "My Trips",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.whiteSmoke,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<PlaceModel>?>(
                        future: sites,
                        builder: (context, siteInfo) {
                          if (siteInfo.hasData) {
                            return PopularSites(siteInfo);
                          } else if (siteInfo.hasError) {
                            return Text('${siteInfo.error}');
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),

                      SizedBox(
                        height: 1,
                      ),

                      FutureBuilder<List<TripModel>?>(
                        future: trips,
                        builder: (context, tripInfo) {
                          if (tripInfo.hasData) {
                            return myTrips(tripInfo);
                          } else if (tripInfo.hasError) {
                            return Text('${tripInfo.error}');
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                      // child: ListView.builder(
                      //   scrollDirection: Axis.vertical,
                      //   itemCount: tripsList.length,
                      //   itemBuilder: (context, index) {
                      //     return InkWell(
                      //       onTap: () => Get.to(TripDetailScreen(
                      //         tripId: tripsList[index].tripId,
                      //         place: tripsList[index].place,
                      //         type: tripsList[index].type,
                      //         title: tripsList[index].title,
                      //         coverPic: tripsList[index].coverPic,
                      //         startDate: tripsList[index].startDate,
                      //         endDate: tripsList[index].startDate,
                      //         startBooking: tripsList[index].startDate,
                      //         endBooking: tripsList[index].startDate,
                      //         level: tripsList[index].level.toString(),
                      //         cost: tripsList[index].cost,
                      //         retrieve: tripsList[index].retrieve,
                      //         teamName: tripsList[index].team,
                      //         description: tripsList[index].description,
                      //         pics: tripsList[index].pics,
                      //         subLimit: tripsList[index].subLimit,
                      //       )),
                      //      child: TripOutSide(
                      //         name: tripsList[index].title,
                      //         date: tripsList[index].startDate,
                      //         pic: tripsList[index].coverPic,
                      //         price: tripsList[index].cost,
                      //         team: tripsList[index].team,
                      //         discreption: tripsList[index].description,
                      //       ),
                      //     );
                      //   }),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.midnightGreen,
                      offset: Offset(0.0, 0.1),
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(AddTrips());
                  },
                  icon: Icon(
                    Icons.add,
                    color: AppColors.rumSwizzle,
                    size: 50,
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

Widget PopularSites(AsyncSnapshot<List<PlaceModel>?> siteInfo) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Popular Sites",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.midnightGreen,
                fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: siteInfo.data?.length ?? 0,
                itemBuilder: (context, index) {
                  PlaceModel? site = siteInfo.data![index];

                  return InkWell(
                    onTap: () {
                      print("jjjjjjjjjjjjjjjjjjjjjjjjjjj");
                      print(site.id);
                      if (site.id != 0) {
                        Get.to(
                          PlaceDetails(Site: site),
                          arguments: site,
                        );
                      } else {
                        print("place id is 0");
                      }
                    },
                    child: PlacesList(
                      name: site.SiteName,
                      coverPic: site.MainPhoto!,
                    ),
                  );
                }),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 2,
            width: double.infinity,
            color: AppColors.midnightGreen,
          ),
        ),
      ],
    );

Widget myTrips(AsyncSnapshot<List<TripModel>?> tripInfo) => Container(
      width: double.infinity,
      height: 500,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tripInfo.data?.length ?? 0,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          TripModel? trip = tripInfo.data![index];

          return InkWell(
            onTap: () {
              Get.to(
                  MyTripDetails(
                    id: trip.id,
                  ),
                  arguments: trip);
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
                            image: NetworkImage(
                                "http://192.168.139.143:8000/app/storage/TripPhotos/i.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  )),
                  Positioned.fill(
                    child: Center(
                      child: Center(
                        child: Center(),
                      ),
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
                        trip!.Title!,
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
      ),
    );
