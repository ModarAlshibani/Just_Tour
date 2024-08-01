import 'package:flutter/material.dart';

import '../../../core/constant/appColors.dart';

class TripOutSide extends StatelessWidget {
  final String? name;
  final String? team;
  final String? date;
  final String? price;
  final String? pic;
  final String? discreption;
  const TripOutSide(
      {super.key,
      this.name,
      this.team,
      this.date,
      this.price,
      this.pic,
      this.discreption});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      width: 320,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 11),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: NetworkImage(pic!), fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        AppColors.blackCurrant.withOpacity(0.9),
                        AppColors.blackCurrant.withOpacity(0.6),
                        AppColors.blackCurrant.withOpacity(0.3),
                        AppColors.blackCurrant.withOpacity(0),
                        AppColors.blackCurrant.withOpacity(0),
                        AppColors.blackCurrant.withOpacity(0),
                      ])),
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
                        AppColors.blackCurrant.withOpacity(0.9),
                        AppColors.blackCurrant.withOpacity(0.7),
                        AppColors.blackCurrant.withOpacity(0),
                        AppColors.blackCurrant.withOpacity(0),
                        AppColors.blackCurrant.withOpacity(0),
                        AppColors.blackCurrant.withOpacity(0),
                        AppColors.blackCurrant.withOpacity(0),
                      ])),
            ),
          ),
          Positioned(
            left: 15,
            top: 15,
            child: Container(
              width: 150,
              child: Text(
                name!,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            left: 15,
            top: 40,
            child: Text(
              team!,
              style: TextStyle(fontSize: 12, color: AppColors.paleGold),
            ),
          ),
          Positioned(
            left: 15,
            top: 58,
            child: Text(
              date!,
              style: TextStyle(fontSize: 12),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 10,
            child: Text(
              price!,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
