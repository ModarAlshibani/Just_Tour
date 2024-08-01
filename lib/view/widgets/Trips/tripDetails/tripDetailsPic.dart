import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import 'package:terez/core/shared/widgets/backButton.dart';

class TripDetailsPic extends StatelessWidget {
  final String coverPic;
  final String title;
  final String place;
  // final List<String> pics;
  const TripDetailsPic({
    super.key,
    required this.coverPic,
    required this.title,
    required this.place,
    // required this.pics
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
              color: AppColors.varidiantGreen,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              image: DecorationImage(
                  image: NetworkImage(coverPic.toString()), fit: BoxFit.cover)),
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.blackCurrant.withOpacity(0.9),
                    AppColors.blackCurrant.withOpacity(0.8),
                    AppColors.blackCurrant.withOpacity(0.7),
                    AppColors.blackCurrant.withOpacity(0.6),
                    AppColors.blackCurrant.withOpacity(0.5),
                    AppColors.blackCurrant.withOpacity(0.4),
                    AppColors.blackCurrant.withOpacity(0.3),
                    AppColors.blackCurrant.withOpacity(0.2),
                    AppColors.blackCurrant.withOpacity(0),
                    AppColors.blackCurrant.withOpacity(0),
                    AppColors.blackCurrant.withOpacity(0.2),
                    AppColors.blackCurrant.withOpacity(0.3),
                    AppColors.blackCurrant.withOpacity(0.4),
                    AppColors.blackCurrant.withOpacity(0.5),
                    AppColors.blackCurrant.withOpacity(0.6),
                    AppColors.blackCurrant.withOpacity(0.7),
                    AppColors.blackCurrant.withOpacity(0.8),
                    AppColors.blackCurrant.withOpacity(0.9),
                  ])),
        ),
        Positioned(
            bottom: 60,
            left: 30,
            child: Container(
              width: 280,
              child: Text(
                "$title",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )),
        Positioned(
            bottom: 36,
            left: 28,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppColors.whiteSmoke,
                ),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  width: 280,
                  child: Text(
                    place,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            )),
        const backButton(),
        // Positioned(
        //     top: 30,
        //     right: 30,
        //     child: Container(
        //       height: 340,
        //       width: 90,
        //       child: ListView.builder(
        //         shrinkWrap: true,
        //         itemCount: pics.length,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             width: 80,
        //             height: 90,
        //             margin: const EdgeInsets.only(bottom: 20),
        //             decoration:
        //                 BoxDecoration(borderRadius: BorderRadius.circular(20)),
        //             child: InkWell(
        //                 onTap: () async {
        //                   showDialog(
        //                     context: context,
        //                     builder: (BuildContext context) {
        //                       return AlertDialog(
        //                         backgroundColor:
        //                             AppColors.blackCurrant.withOpacity(0),
        //                         content: Column(
        //                           children: [
        //                             const SizedBox(
        //                               height: 160,
        //                             ),
        //                             Container(
        //                               width: 400,
        //                               height: 400,
        //                               child: PhotoView(
        //                                 imageProvider:
        //                                     NetworkImage(pics[index]),
        //                                 loadingBuilder: (context, progress) =>
        //                                     Center(
        //                                   child: CircularProgressIndicator(
        //                                     value: progress
        //                                                 ?.expectedTotalBytes !=
        //                                             null
        //                                         ? progress!
        //                                                 .cumulativeBytesLoaded /
        //                                             progress.expectedTotalBytes!
        //                                         : null,
        //                                   ),
        //                                 ),
        //                                 backgroundDecoration: BoxDecoration(
        //                                   color: Theme.of(context)
        //                                       .scaffoldBackgroundColor,
        //                                 ),
        //                                 minScale:
        //                                     PhotoViewComputedScale.covered * 1,
        //                                 maxScale:
        //                                     PhotoViewComputedScale.covered * 1,
        //                               ),
        //                             ),
        //                             ElevatedButton(
        //                               style: ElevatedButton.styleFrom(
        //                                   shape: RoundedRectangleBorder(
        //                                       borderRadius:
        //                                           BorderRadius.circular(10))),
        //                               onPressed: () async {
        //                                 try {
        //                                   final response = await http
        //                                       .get(Uri.parse(pics[index]));
        //                                   if (response.statusCode == 200) {
        //                                     final bytes = response.bodyBytes;
        //                                     final result =
        //                                         await ImageGallerySaver
        //                                             .saveImage(
        //                                       bytes,
        //                                       name: "saved_image.jpg",
        //                                     );
        //                                     if (result == true) {
        //                                       ScaffoldMessenger.of(context)
        //                                           .showSnackBar(
        //                                         const SnackBar(
        //                                           content: Text(
        //                                               'Image saved successfully'),
        //                                         ),
        //                                       );
        //                                     } else {
        //                                       ScaffoldMessenger.of(context)
        //                                           .showSnackBar(
        //                                         const SnackBar(
        //                                           content: Text(
        //                                               'Image saved successfully !'),
        //                                         ),
        //                                       );
        //                                     }
        //                                   } else {
        //                                     ScaffoldMessenger.of(context)
        //                                         .showSnackBar(
        //                                       const SnackBar(
        //                                         content: Text(
        //                                             'Failed to fetch image.'),
        //                                       ),
        //                                     );
        //                                   }
        //                                 } catch (e) {
        //                                   // Log the exception for debugging
        //                                   print('Error saving image: $e');
        //                                   ScaffoldMessenger.of(context)
        //                                       .showSnackBar(
        //                                     SnackBar(
        //                                       content:
        //                                           Text('An error occurred: $e'),
        //                                     ),
        //                                   );
        //                                 }
        //                               },
        //                               child: const Text('Save Image'),
        //                             ),
        //                           ],
        //                         ),
        //                       );
        //                     },
        //                   );
        //                 },
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(15),
        //                       border: Border.all(width: 2, color: Colors.white),
        //                       image: DecorationImage(
        //                           image: NetworkImage(
        //                             pics[index],
        //                           ),
        //                           fit: BoxFit.cover)),
        //                 )),
        //           );
        //         },
        //       ),
        //     ))
      ],
    );
  }
}
