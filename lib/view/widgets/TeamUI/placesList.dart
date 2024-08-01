import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';


class PlacesList extends StatelessWidget{
  final String? name;
  final String? coverPic;

  const PlacesList({super.key, this.name, this.coverPic}); 

  @override

  Widget build(BuildContext context){

    return Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: Container(
                                             width: 120,
                                             decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(coverPic!), fit: BoxFit.cover),
                                             
                                              
                                              
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
                                          ),
                                          Positioned( bottom: 10, left: 10,
                                            child: Text(name!, 
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                          ),
                                        ],
                                      );
  }
}