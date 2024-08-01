import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/TeamUI/AddTrips.dart';
import 'package:terez/view/screens/Trips/TripDetailScreen.dart';
import 'package:terez/view/widgets/TeamUI/popularSites.dart';
import 'package:terez/view/widgets/Trips/tripOutsideVertical.dart';

class TeamHomepage extends StatelessWidget{

  @override

  Widget build(BuildContext context){

    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.midnightGreen,
            
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 30),
            child: Text("My Trips",
            style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteSmoke,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            ),

            child: SingleChildScrollView(
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopularSites(),
              
                  Container(
                    height: 500,
                    width: double.infinity,
                                
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: tripsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          // onTap: () => Get.to(TripDetailScreen(
                          //   tripId: tripsList[index].tripId,
                          //   place: tripsList[index].place,
                          //   type: tripsList[index].type,
                          //   title: tripsList[index].title,
                          //   coverPic: tripsList[index].coverPic,
                          //   startDate: tripsList[index].startDate,
                          //   endDate: tripsList[index].startDate,
                          //   startBooking: tripsList[index].startDate,
                          //   endBooking: tripsList[index].startDate,
                          //   level: tripsList[index].level.toString(),
                          //   cost: tripsList[index].cost,
                          //   retrieve: tripsList[index].retrieve,
                          //   teamName: tripsList[index].team,
                          //   description: tripsList[index].description,
                          //   pics: tripsList[index].pics,
                          //   subLimit: tripsList[index].subLimit,
                          // )),
                          // child: TripOutSide(
                          //   name: tripsList[index].title,
                          //   date: tripsList[index].startDate,
                          //   pic: tripsList[index].coverPic,
                          //   price: tripsList[index].cost,
                          //   team: tripsList[index].team,
                          //   discreption: tripsList[index].description,
                          // ),
                        );
                      }),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20, right: 20,
            
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                                BoxShadow(
                                  color: AppColors.midnightGreen,
                                  offset: Offset(0.0, 0.1),
                                  blurRadius: 1.0,
                                ),
                              ],
              ),
              child: IconButton(
                onPressed: () {
                  Get.to(AddTrips());
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.rumSwizzle,
                  size: 50,
                ),
              ),
            ),
          ),
          
        
      ],
    );
    
  }
}