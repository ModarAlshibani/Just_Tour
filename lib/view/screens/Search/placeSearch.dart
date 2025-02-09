import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Sites%20Controller/showAllSitesController.dart';
import 'package:JustTour/controller/Trips%20Controller/showTripsController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/dataSource/statics/static.dart';
import 'package:JustTour/data/model/place_model.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/Places/placeDetails.dart';
import 'package:JustTour/view/screens/TeamUI/myTripDetails.dart';

class PlaceSearchScreen extends StatefulWidget {
  const PlaceSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PlaceSearchScreen> createState() => _PlaceSearchScreen();
}

late Future<List<PlaceModel>?> sites;

@override
void initState() {
  sites = ShowSitesController().getSites();
}

class _PlaceSearchScreen extends State<PlaceSearchScreen> {
  String searchValue = '';
  @override
  void updateList(BuildContext context, String value) {
    setState(() {
      searchValue = value;
    });
  }

  Widget build(BuildContext context) {
    sites = ShowSitesController().getSites();

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
                        hintText: "Search for a Site"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<PlaceModel>?>(
              future: sites,
              builder: (context, AsyncSnapshot<List<PlaceModel>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  List<PlaceModel> filteredSites = snapshot.data!
                      .where((site) =>
                          site.SiteName!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()) ||
                          site.Location!
                              .toLowerCase()
                              .contains(searchValue.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    itemCount: filteredSites.length,
                    itemBuilder: (context, index) {
                      PlaceModel site = filteredSites[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                            PlaceDetails(Site: site),
                            arguments: site,
                          );
                        },
                        child: Container(
                          child: ListTile(
                            title: Text(site.SiteName!),
                            subtitle: Text("{site.Location!}"),
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
