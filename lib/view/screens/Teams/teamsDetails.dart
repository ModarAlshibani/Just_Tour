import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/view/widgets/Teams/teamDet.dart';

class taemsDetails extends StatelessWidget{
  final String? teamName;
final String? teamPic;
final String? description;
//final String? tripsList;

const taemsDetails({super.key, required this.teamName, required this.teamPic, required this.description, /*required this.tripsList*/});
  
  
  Widget build(BuildContext context) {
    
    ScrollController _scrollController = ScrollController();
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 219, 219, 219),
          ),

          Column(
            children: [
              TeamDet( teamName: teamName!, teamPic: teamPic!),
              
               Container( 
                             decoration: BoxDecoration(
                               boxShadow: [
                                BoxShadow(
                                  color: AppColors.midnightGreen,
                                  offset: Offset(0.0, 0.1),
                                  blurRadius: 2.0,
                                ),
                              ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
      height: 280,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Description:",
                style: TextStyle(
                    color: AppColors.blackCurrant,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              child: Text(
                description!,
                style: TextStyle(
                                       fontSize: 15,
                                        color: Colors.black,
                                       ), ),
            ),
            const SizedBox(
              height: 30,
            ),
 
          ],
        ),
      ),
    ),
    Positioned( bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,),
                    child: Container(
                            height: 220,
                            width: 500,
                           
                            child: ListView.builder(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){print('object');},
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8,),
                                      child: Stack(
                                        children: [
                                          Container(
                                           width: 170,
                                           decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(imageAsset.onBoarding1),
                                            fit: BoxFit.fill,
                                            
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                BoxShadow(
                                  color: AppColors.midnightGreen,
                                  offset: Offset(0.0, 0.1),
                                  blurRadius: 2.0,
                                ),
                              ],
                                           ),
                                         ),
                                          Positioned( bottom: 10, left: 10,
                                            child: Text("data",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                  ),
                ),
            ],
          ),
         

        ],
      ),
    );
  }


}