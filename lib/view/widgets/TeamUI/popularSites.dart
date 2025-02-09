// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:terez/core/constant/appColors.dart';
// import 'package:terez/data/dataSource/statics/static.dart';
// import 'package:terez/view/widgets/TeamUI/placesList.dart';

// import '../../screens/Places/placeDetails.dart';


// class PopularSites extends StatelessWidget{
//   @override

//   Widget build(BuildContext context){

//     return Column( crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//          SizedBox(height: 20,),
              
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Text("Popular Sites",
//                     style: Theme.of(context)
//                                   .textTheme
//                                   .bodyMedium!
//                                   .copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: AppColors.midnightGreen,
//                                       fontSize: 20),
//                     ),
//                   ),
              
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Container(
//                       height: 150,
//                       width: double.infinity,
//                       child: ListView.builder( 
//                         scrollDirection: Axis.horizontal,
//                         itemCount: placesList.length, 
//                         itemBuilder: (context, index) => 
//                         InkWell(
//                           onTap: () => Get.to(
//                             PlaceDetails(
// )
//                             ),
//                           child: PlacesList(
//                             name: placesList[index].name!,
//                             coverPic: placesList[index].coverPic!
//                             ),
//                         )),
//                     ),
//                   ),

//                   SizedBox(height: 20,),
                  
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Container(height: 2,
//                     width: double.infinity,
//                     color: AppColors.midnightGreen,
//                     ),
//                   ),
//       ],
//     );
//   }
// }