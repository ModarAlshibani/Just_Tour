import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';

class SitesFollowedList extends StatelessWidget {
  final String? name;
  final String? picture;

  const SitesFollowedList({super.key, this.name, this.picture});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 74,
                  width: 74,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.midnightGreen, width: 1),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(picture!),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 160,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        name!,
                        style: TextStyle(
                            color: AppColors.midnightGreen, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                //  Follow()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
