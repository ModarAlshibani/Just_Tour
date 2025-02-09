import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Trips%20Controller/showTripsController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/dataSource/statics/static.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/TeamUI/myTripDetails.dart';
import 'package:JustTour/view/screens/Trips/tripDetailsScreenUser%20(2).dart';

class HomepageSearchScreen extends StatefulWidget {
  const HomepageSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomepageSearchScreen> createState() => _SearchScreenState();
}

late Future<List<TripModel>?> trips;

@override
void initState() {
  trips = TripController().getallTrips();
}

class _SearchScreenState extends State<HomepageSearchScreen> {
  String searchValue = '';
  @override
  void updateList(BuildContext context, String value) {
    setState(() {
      searchValue = value;
    });
  }

  Widget build(BuildContext context) {
    trips = TripController().getallTrips();

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.midnightGreen,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.midnightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.midnightGreen,
                      offset: Offset(0.0, 0.1),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) => updateList(context, value),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.midnightGreen,
                          size: 20,
                        ),
                        hintText: "Search for a Trip"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<TripModel>?>(
              future: trips,
              builder: (context, AsyncSnapshot<List<TripModel>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  List<TripModel> filteredTrips = snapshot.data!
                      .where((trip) =>
                          trip.Title!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()) ||
                          trip.TeamName!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()) ||
                          trip.Location!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()) ||
                          trip.Type!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()) ||
                          trip.Cost!
                              .toString()
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    itemCount: filteredTrips.length,
                    itemBuilder: (context, index) {
                      TripModel trip = filteredTrips[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            TripDetailsScreenUser(
                              id: trip.id,
                            ),
                            arguments: trip,
                          );
                        },
                        child: Container(
                          child: ListTile(
                            title: Text(trip.Title!),
                            subtitle:
                                Text("${trip.TeamName!} \n${trip.Location!}"),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
