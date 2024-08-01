import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';

class Advertisement extends StatelessWidget{

  @override

  Widget build(BuildContext context){

    return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.midnightGreen),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage('https://t3.ftcdn.net/jpg/05/09/27/46/360_F_509274673_e3MLr6rTVPlPbNOTKRrIMTk2fZwqkcst.jpg')),
                        ),
                        
                      );
  }
}