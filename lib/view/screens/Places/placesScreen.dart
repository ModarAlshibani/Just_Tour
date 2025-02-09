import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:terez/controller/Sites%20Controller/showAllSitesController.dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/data/model/place_model.dart';
import 'package:terez/view/screens/Places/placeDetails.dart';
import 'package:terez/view/screens/Search/placeSearch.dart';
import 'package:terez/view/widgets/Sites/SiteOutside.dart';

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
                    //  Get.to(PlaceSearchScreen());
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
                  builder: (context, siteInfo){
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


Widget getSite(AsyncSnapshot<List<PlaceModel>?> siteInfo) =>

               ListView.builder(
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
                        () =>
                        PlaceDetails(id: site.id ?? 0),
                        arguments: site,
                      );
                    },
                    child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 7, right: 7, bottom: 5),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 390,
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     image: NetworkImage(imageAsset.camping),
                              //   fit: BoxFit.fill),
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
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
                          child: Text("${site.SiteName!}",
                          style: TextStyle(
                            color: AppColors.rumSwizzle,
                            fontWeight: FontWeight.w400 ,
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








// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:terez/core/constant/appColors.dart';
// import 'package:terez/data/dataSource/statics/static.dart';
// import 'package:terez/view/screens/Places/placeDetails.dart';

// class PlacesScreen extends StatelessWidget {
//   const PlacesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("places"),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: placesList.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () => Get.to(PlaceDetails(
//                   placeId: placesList[index].placeId!,
//                   name: placesList[index].name!,
//                   location: placesList[index].location!,
//                   description: placesList[index].description!,
//                   coverPic: placesList[index].coverPic!,
//                   pics: placesList[index].pics!,
//                 )),
//                 child: Container(
//                   width: 300,
//                   height: 100,
//                   margin: EdgeInsets.all(20),
//                   color: AppColors.midnightGreen,
//                   child: Text(
//                     placesList[index].name!,
//                     style: TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
