import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/Search/placeSearch.dart';
import 'package:terez/view/screens/Places/placeDetails.dart';
import 'package:terez/view/widgets/Sites/SiteOutside.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: BoxDecoration(
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
                    Get.to(
                      PlaceSearchScreen());
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                              Get.to(PlaceDetails(
                              placeId: placesList[index].placeId!,
                              name: placesList[index].name!,
                              location: placesList[index].location!,
                              description: placesList[index].description!,
                              coverPic: placesList[index].coverPic!,
                              pics: placesList[index].pics!,
                              ));
                    },
                    child: SitesOutside(
                      placeName: placesList[index].name!,
                      placePic: placesList[index].coverPic!,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}








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
