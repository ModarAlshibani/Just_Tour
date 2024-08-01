import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/shared/widgets/backButton.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/Places/placeDetails.dart';
import 'package:terez/view/screens/Teams/teamsDetails.dart';
import 'package:terez/view/widgets/Follow/followingListPicker.dart';
import 'package:terez/view/widgets/Follow/sitesFollowedList.dart';
import 'package:terez/view/widgets/Follow/teamsFollowedList.dart';
import 'package:terez/view/widgets/Trips/tripOutsideVertical.dart';

class MyFollowing extends StatefulWidget{

  @override
  State<MyFollowing> createState() => _MyFollowingState();
}

class _MyFollowingState extends State<MyFollowing> {
 
  bool show = true;
  void updateShow(bool value) {
    setState(() {
      show = value;
    },);
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
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
            child: Row( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.grey,)),

                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "My Following",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 20),
                  ),
                ),
              ],
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
                padding: const EdgeInsets.only(top: 16, left: 50),
                child: FollowingListPicker(updateShow: updateShow),
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
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
              child: show? ListView.builder(
                itemCount: TeamsList.length,
                 itemBuilder: (context, index) => InkWell(
                  onTap: () => Get.to(
                        taemsDetails(
                          teamName: TeamsList[index].teamName,
                          teamPic:  TeamsList[index].teamPic!, 
                          description: TeamsList[index].description!, 
                        ),
                      ),
                   child: Container(
                     child: TeamsFollowedList(
                      picture: TeamsList[index].teamPic!,
                      name: TeamsList[index].teamName!,
                                     ),
                   ),
                 ),
              ): ListView.builder(
                itemCount: placesList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Get.to(PlaceDetails(
                              placeId: placesList[index].placeId!,
                              name: placesList[index].name!,
                              location: placesList[index].location!,
                              description: placesList[index].description!,
                              coverPic: placesList[index].coverPic!,
                              pics: placesList[index].pics!,
                              )),

                  
                  child: Container(
                    child: SitesFollowedList(
                      name: placesList[index].name,
                      picture: placesList[index].coverPic,
                    ),
                  ),
                ),)
               ),
      ),
      ],),);
  }
}