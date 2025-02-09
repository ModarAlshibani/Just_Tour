import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';

class FollowersList extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/teamNav');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.midnightGreen,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 50),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, 
                    icon: Icon(Icons.arrow_back_ios,
                    color: AppColors.rumSwizzle,)
                    ),
                    SizedBox(width: 40,),
                    Text("My Followers",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
            ),
          ],
        ),
          
          
        
      ),
    );
  }
}