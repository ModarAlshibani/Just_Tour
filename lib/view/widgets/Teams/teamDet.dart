import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:JustTour/core/constant/appColors.dart';

class TeamDet extends StatefulWidget {
  final String? teamName;
  final String? teamPic;
  final double? Rate;

  const TeamDet({
    super.key,
    required this.teamName,
    required this.teamPic,
    this.Rate,
  });

  @override
  State<TeamDet> createState() => _TeamDetState();
}

class _TeamDetState extends State<TeamDet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: (BoxDecoration(
        color: AppColors.midnightGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      )),
      child: Stack(
        children: [
          Positioned(
            left: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("${widget.teamPic}"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    // color: Colors.white,
                    height: 67,
                    width: 280,
                    child: Center(
                      child: Text(
                        "${widget.teamName}",
                        textAlign: TextAlign.center,
                        //     softWrap: false,
                        maxLines: 2,
                        style: TextStyle(fontSize: 22, color: AppColors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RatingBar.builder(
                  initialRating: widget.Rate!,
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (double value) {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 45,
            left: 9,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.grey,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
