import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/widgets/Follow/Follow.dart';

class TeamItem extends StatelessWidget {

final String teamName;
final String teamPic;
final String description;
//final String tripsList;


  const TeamItem({super.key, required this.teamName,
   required this.teamPic, 
   required this.description, 
   //required this.tripsList
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding:
                        const EdgeInsets.only(top: 13, left: 15, right: 15),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 390,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                           
                             
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.midnightGreen,
                                offset: Offset(0.0, 0.1),
                                blurRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      teamName,
                                      softWrap: false,
                                      style: TextStyle(
                                        color: AppColors.midnightGreen.withOpacity(0.7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(teamPic),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Container(
                                          //color: Colors.white,
                                          width: 220,
                                          height: 70,
                                          child: Text(
                                            description,
                                            // softWrap: false,
                                            style: TextStyle(
                                              color: AppColors.blackCurrant,
                                              fontSize: 13,
                                            ),
                                            maxLines: 3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 2,
                          child: Follow(buttonColor: AppColors.orange, textColor: AppColors.grey, state: false, textSize: 12, height: 30, width: 70,),
                        ),
                      ],
                    ),
                  );
  }
}