import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';

class Follow extends StatelessWidget{

   final bool? state;
   final Color? buttonColor;
   final Color? textColor;
   final double? textSize; 
   final double? height;
   final double? width;
   

   const Follow({super.key, required this.buttonColor, required this.textColor, required this.state, required this.textSize,
   required this.height, required this.width});

  @override

  Widget build(BuildContext context){

    return MaterialButton(
                              onPressed: (){print("object");},
                              child: Container( 
                                height: height,
                                width: width, 
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                    color: AppColors.blackCurrant,
                                    offset: Offset(0.0, 0.1),
                                    blurRadius: 2.0,
                                    ),
                                  ],
                                  color: buttonColor,
                                  borderRadius: BorderRadius.circular(10,),
                                ),
                                child: Center(child: Text('Follow',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: textSize,
                                  fontWeight: FontWeight.bold,
                                ),)),
                              ),
                            );
  }
}