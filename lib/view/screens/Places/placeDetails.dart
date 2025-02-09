import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/shared/widgets/backButton.dart';
import 'package:JustTour/data/model/place_model.dart';
import 'package:JustTour/view/widgets/Trips/tripDetails/Description.dart';

class PlaceDetails extends StatefulWidget {
  final PlaceModel Site;

  const PlaceDetails({super.key, required this.Site});

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

late Future<PlaceModel?> site;

class _PlaceDetailsState extends State<PlaceDetails> {
  // @override
  //   void initState() {
  //   // site = ShowSitesController().userGetSiteDetails(widget.id);
  // }

  Widget build(BuildContext context) {
    // site = ShowSitesController().userGetSiteDetails(widget.id);

    return Scaffold(
        backgroundColor: AppColors.grey,
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.Site.MainPhoto!),
                          fit: BoxFit.cover)),
                )),
                backButton(),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(65),
                              topRight: Radius.circular(65))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 350,
                            child: Text(
                              widget.Site.SiteName!,
                              style: TextStyle(
                                  color: AppColors.blackCurrant,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Center(
                          //   child: Container(
                          //     margin: EdgeInsets.only(left: 17, right: 20),
                          //     height: 92,
                          //     width: 400,
                          //     child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       shrinkWrap: true,
                          //       itemCount: pics.length,
                          //       itemBuilder: (context, index) {
                          //         return Container(
                          //           width: 90,
                          //           height: 100,
                          //           margin:
                          //               const EdgeInsets.only(left: 10, right: 5),
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(20)),
                          //           child: InkWell(
                          //               onTap: () async {
                          //                 showDialog(
                          //                   context: context,
                          //                   builder: (BuildContext context) {
                          //                     return AlertDialog(
                          //                       backgroundColor: AppColors
                          //                           .blackCurrant
                          //                           .withOpacity(0),
                          //                       content: Column(
                          //                         children: [
                          //                           SizedBox(
                          //                             height: 160,
                          //                           ),
                          //                           Container(
                          //                             width: 400,
                          //                             height: 400,
                          //                             child: PhotoView(
                          //                               imageProvider:
                          //                                   NetworkImage(
                          //                                       pics[index]),
                          //                               loadingBuilder:
                          //                                   (context, progress) =>
                          //                                       Center(
                          //                                 child:
                          //                                     CircularProgressIndicator(
                          //                                   value: progress
                          //                                               ?.expectedTotalBytes !=
                          //                                           null
                          //                                       ? progress!
                          //                                               .cumulativeBytesLoaded /
                          //                                           progress
                          //                                               .expectedTotalBytes!
                          //                                       : null,
                          //                                 ),
                          //                               ),
                          //                               backgroundDecoration:
                          //                                   BoxDecoration(
                          //                                 color: Theme.of(context)
                          //                                     .scaffoldBackgroundColor,
                          //                               ),
                          //                               minScale:
                          //                                   PhotoViewComputedScale
                          //                                           .covered *
                          //                                       1,
                          //                               maxScale:
                          //                                   PhotoViewComputedScale
                          //                                           .covered *
                          //                                       1,
                          //                             ),
                          //                           ),
                          //                           ElevatedButton(
                          //                             style: ElevatedButton.styleFrom(
                          //                                 shape: RoundedRectangleBorder(
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 10))),
                          //                             onPressed: () async {
                          //                               try {
                          //                                 final response =
                          //                                     await http.get(
                          //                                         Uri.parse(pics[
                          //                                             index]));
                          //                                 if (response
                          //                                         .statusCode ==
                          //                                     200) {
                          //                                   final bytes = response
                          //                                       .bodyBytes;
                          //                                   final result =
                          //                                       await ImageGallerySaver
                          //                                           .saveImage(
                          //                                     bytes,
                          //                                     name:
                          //                                         "saved_image.jpg",
                          //                                   );
                          //                                   if (result == true) {
                          //                                     ScaffoldMessenger
                          //                                             .of(context)
                          //                                         .showSnackBar(
                          //                                       SnackBar(
                          //                                         content: Text(
                          //                                             'Image saved successfully'),
                          //                                       ),
                          //                                     );
                          //                                   } else {
                          //                                     ScaffoldMessenger
                          //                                             .of(context)
                          //                                         .showSnackBar(
                          //                                       SnackBar(
                          //                                         content: Text(
                          //                                             'Image saved successfully !'),
                          //                                       ),
                          //                                     );
                          //                                   }
                          //                                 } else {
                          //                                   ScaffoldMessenger.of(
                          //                                           context)
                          //                                       .showSnackBar(
                          //                                     SnackBar(
                          //                                       content: Text(
                          //                                           'Failed to fetch image.'),
                          //                                     ),
                          //                                   );
                          //                                 }
                          //                               } catch (e) {
                          //                                 // Log the exception for debugging
                          //                                 print(
                          //                                     'Error saving image: $e');
                          //                                 ScaffoldMessenger.of(
                          //                                         context)
                          //                                     .showSnackBar(
                          //                                   SnackBar(
                          //                                     content: Text(
                          //                                         'An error occurred: $e'),
                          //                                   ),
                          //                                 );
                          //                               }
                          //                             },
                          //                             child: Text('Save Image'),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     );
                          //                   },
                          //                 );
                          //               },
                          //               child: Container(
                          //                 decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(15),
                          //                     border: Border.all(
                          //                         width: 2,
                          //                         color: AppColors.blackCurrant
                          //                             .withOpacity(0.5)),
                          //                     image: DecorationImage(
                          //                         image: NetworkImage(
                          //                           pics[index],
                          //                         ),
                          //                         fit: BoxFit.cover)),
                          //               )),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          DescriptionText(
                              description:
                                  "${widget.Site.Details}\n Location: ${widget.Site.Location} "),
                        ],
                      ),
                    ))
              ],
            )));
  }
}

Widget getSiteDetails(AsyncSnapshot<PlaceModel?> siteInfo) => Container(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: [
        Positioned.fill(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("{siteInfo.data?.MainPhoto}"),
                  fit: BoxFit.cover)),
        )),
        backButton(),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65),
                      topRight: Radius.circular(65))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      "${siteInfo.data?.SiteName}",
                      style: TextStyle(
                          color: AppColors.blackCurrant,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Center(
                  //   child: Container(
                  //     margin: EdgeInsets.only(left: 17, right: 20),
                  //     height: 92,
                  //     width: 400,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       itemCount: pics.length,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           width: 90,
                  //           height: 100,
                  //           margin:
                  //               const EdgeInsets.only(left: 10, right: 5),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20)),
                  //           child: InkWell(
                  //               onTap: () async {
                  //                 showDialog(
                  //                   context: context,
                  //                   builder: (BuildContext context) {
                  //                     return AlertDialog(
                  //                       backgroundColor: AppColors
                  //                           .blackCurrant
                  //                           .withOpacity(0),
                  //                       content: Column(
                  //                         children: [
                  //                           SizedBox(
                  //                             height: 160,
                  //                           ),
                  //                           Container(
                  //                             width: 400,
                  //                             height: 400,
                  //                             child: PhotoView(
                  //                               imageProvider:
                  //                                   NetworkImage(
                  //                                       pics[index]),
                  //                               loadingBuilder:
                  //                                   (context, progress) =>
                  //                                       Center(
                  //                                 child:
                  //                                     CircularProgressIndicator(
                  //                                   value: progress
                  //                                               ?.expectedTotalBytes !=
                  //                                           null
                  //                                       ? progress!
                  //                                               .cumulativeBytesLoaded /
                  //                                           progress
                  //                                               .expectedTotalBytes!
                  //                                       : null,
                  //                                 ),
                  //                               ),
                  //                               backgroundDecoration:
                  //                                   BoxDecoration(
                  //                                 color: Theme.of(context)
                  //                                     .scaffoldBackgroundColor,
                  //                               ),
                  //                               minScale:
                  //                                   PhotoViewComputedScale
                  //                                           .covered *
                  //                                       1,
                  //                               maxScale:
                  //                                   PhotoViewComputedScale
                  //                                           .covered *
                  //                                       1,
                  //                             ),
                  //                           ),
                  //                           ElevatedButton(
                  //                             style: ElevatedButton.styleFrom(
                  //                                 shape: RoundedRectangleBorder(
                  //                                     borderRadius:
                  //                                         BorderRadius
                  //                                             .circular(
                  //                                                 10))),
                  //                             onPressed: () async {
                  //                               try {
                  //                                 final response =
                  //                                     await http.get(
                  //                                         Uri.parse(pics[
                  //                                             index]));
                  //                                 if (response
                  //                                         .statusCode ==
                  //                                     200) {
                  //                                   final bytes = response
                  //                                       .bodyBytes;
                  //                                   final result =
                  //                                       await ImageGallerySaver
                  //                                           .saveImage(
                  //                                     bytes,
                  //                                     name:
                  //                                         "saved_image.jpg",
                  //                                   );
                  //                                   if (result == true) {
                  //                                     ScaffoldMessenger
                  //                                             .of(context)
                  //                                         .showSnackBar(
                  //                                       SnackBar(
                  //                                         content: Text(
                  //                                             'Image saved successfully'),
                  //                                       ),
                  //                                     );
                  //                                   } else {
                  //                                     ScaffoldMessenger
                  //                                             .of(context)
                  //                                         .showSnackBar(
                  //                                       SnackBar(
                  //                                         content: Text(
                  //                                             'Image saved successfully !'),
                  //                                       ),
                  //                                     );
                  //                                   }
                  //                                 } else {
                  //                                   ScaffoldMessenger.of(
                  //                                           context)
                  //                                       .showSnackBar(
                  //                                     SnackBar(
                  //                                       content: Text(
                  //                                           'Failed to fetch image.'),
                  //                                     ),
                  //                                   );
                  //                                 }
                  //                               } catch (e) {
                  //                                 // Log the exception for debugging
                  //                                 print(
                  //                                     'Error saving image: $e');
                  //                                 ScaffoldMessenger.of(
                  //                                         context)
                  //                                     .showSnackBar(
                  //                                   SnackBar(
                  //                                     content: Text(
                  //                                         'An error occurred: $e'),
                  //                                   ),
                  //                                 );
                  //                               }
                  //                             },
                  //                             child: Text('Save Image'),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   },
                  //                 );
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     borderRadius:
                  //                         BorderRadius.circular(15),
                  //                     border: Border.all(
                  //                         width: 2,
                  //                         color: AppColors.blackCurrant
                  //                             .withOpacity(0.5)),
                  //                     image: DecorationImage(
                  //                         image: NetworkImage(
                  //                           pics[index],
                  //                         ),
                  //                         fit: BoxFit.cover)),
                  //               )),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  DescriptionText(
                      description:
                          "${siteInfo.data?.Details}\n Location: ${siteInfo.data?.Location} "),
                ],
              ),
            ))
      ],
    ));
