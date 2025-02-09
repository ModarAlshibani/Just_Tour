import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';

class teamsCircle extends StatelessWidget {
  final String? teamName;
  final String? teamPic;

  const teamsCircle({super.key, required this.teamName, required this.teamPic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 9),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.midnightGreen,
            child: Center(
              child: CircleAvatar(
                radius: 38,
                backgroundImage: NetworkImage(teamPic!),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 42,
          width: 70,
          child: Center(
            child: Text(
              teamName!,
              style: TextStyle(
                color: AppColors.midnightGreen,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
