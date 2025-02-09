import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';

class EnrollBar extends StatelessWidget {
  final int? cost;
  const EnrollBar({super.key, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total price",
                  style: TextStyle(
                      color: AppColors.blackCurrant.withOpacity(0.6),
                      fontSize: 15),
                ),
                Text(
                  cost!.toString() + "S.p",
                  style: TextStyle(
                      color: AppColors.blackCurrant,
                      fontSize: 22,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 163,
          ),
          InkWell(
            onTap: () => Get.toNamed("/enrollementScreen"),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.blackCurrant,
                  borderRadius: BorderRadius.circular(50)),
              child: Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.whiteSmoke.withOpacity(0.8),
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
