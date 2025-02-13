import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:JustTour/core/constant/appColors.dart';

class TeamsFollowedList extends StatelessWidget {
  final String picture;
  final String name;

  const TeamsFollowedList(
      {super.key, required this.picture, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.midnightGreen,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 37,
                  backgroundColor: AppColors.midnightGreen,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(picture!),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 100,
                  width: 164,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        name!,
                        style: TextStyle(
                            color: AppColors.midnightGreen, fontSize: 15),
                      ),
                    ],
                  ),
                ),

                ///  Follow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
