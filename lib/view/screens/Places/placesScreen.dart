import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Sites%20Controller/showAllSitesController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/place_model.dart';
import 'package:JustTour/view/screens/Places/placeDetails.dart';
import 'package:JustTour/view/screens/Search/placeSearch.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

late Future<List<PlaceModel>?> sitesList;

@override
void initState() {
  sitesList = ShowSitesController().getSites();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    sitesList = ShowSitesController().getSites();

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/nav');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.grey,
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
                  "Sites",
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
                  color: Color.fromARGB(255, 188, 188, 188),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(PlaceSearchScreen());
                    },
                    child: Icon(
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
                child: FutureBuilder(
                    future: sitesList,
                    builder: (context, siteInfo) {
                      if (siteInfo.hasData) {
                        return getSite(siteInfo);
                      } else if (siteInfo.hasError) {
                        return Text('${siteInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getSite(AsyncSnapshot<List<PlaceModel>?> siteInfo) => ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: siteInfo.data?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        PlaceModel site = siteInfo.data![index];

        return InkWell(
          onTap: () {
            // print(Get.find<GlobalStateController>().getToken());
            print("${site.id}");
            Get.to(
              () => PlaceDetails(Site: site),
              arguments: site,
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 13, left: 7, right: 7, bottom: 5),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 390,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(site.MainPhoto!),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
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
                                AppColors.blackCurrant,
                                AppColors.blackCurrant.withOpacity(0.8),
                                AppColors.blackCurrant.withOpacity(0.6),
                                AppColors.blackCurrant.withOpacity(0.4),
                                AppColors.blackCurrant.withOpacity(0),
                                AppColors.blackCurrant.withOpacity(0),
                                AppColors.blackCurrant.withOpacity(0),
                                AppColors.blackCurrant.withOpacity(0),
                                AppColors.blackCurrant.withOpacity(0),
                                AppColors.blackCurrant.withOpacity(0),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Text(
                    "${site.SiteName!}",
                    style: TextStyle(
                      color: AppColors.rumSwizzle,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                // Positioned(
                //   top: 2,
                //   right: 5,
                //   child: Follow(buttonColor: AppColors.whiteSmoke, textColor: AppColors.orange,textSize: 14, height: 30, width: 60, buttonText: '',)
                // ),
              ],
            ),
          ),
        );
      },
    );
