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

class Log extends StatefulWidget{

  @override
  State<Log> createState() => _Log();
}

class _Log extends State<Log> {
 

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
                    "My Log",
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
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Container(
              width: double.infinity,
              height: 700,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: AppColors.orange,
                      
                    ),
                  );
                },),
            ),
          ),
      ],),);
  }
}