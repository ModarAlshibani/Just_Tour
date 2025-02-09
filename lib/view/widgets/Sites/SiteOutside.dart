import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/constant/imageAssets.dart';

class SitesOutside extends StatelessWidget {
  final String? placeName;
  final String? photo;

  const SitesOutside({
    super.key,
    this.placeName,
    this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 7, right: 7, bottom: 5),
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: 390,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(photo!), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.blackCurrant,
                          AppColors.blackCurrant.withOpacity(0.8),
                          AppColors.blackCurrant.withOpacity(0.6),
                          AppColors.blackCurrant.withOpacity(0.4),
                          AppColors.blackCurrant.withOpacity(0),
                          AppColors.blackCurrant.withOpacity(0),
                          AppColors.blackCurrant.withOpacity(0),
                          AppColors.blackCurrant.withOpacity(0),
                          AppColors.blackCurrant.withOpacity(0),
                          AppColors.blackCurrant.withOpacity(0),
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              "$placeName",
              style: TextStyle(
                color: AppColors.rumSwizzle,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          // Positioned(
          //   top: 2,
          //   right: 5,
          //   child: Follow(buttonColor: AppColors.whiteSmoke, textColor: AppColors.orange,textSize: 14, height: 30, width: 60, buttonText: '',)
          // ),
        ],
      ),
    );
  }
}
