import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/widgets/Trips/tripDetails/Description.dart';
import 'package:terez/view/widgets/Trips/tripDetails/EnrollBar.dart';
import 'package:terez/view/widgets/Trips/tripDetails/mainInfoRow.dart';
import 'package:terez/view/widgets/Trips/tripDetails/tripDetailsPic.dart';

class TripDetailScreen extends StatelessWidget {
  final int? id;
  final String? team_id;
  final String? TeamName;
  final String? Title;
  final DateTime? StartDate;
  final DateTime? EndDate;
  final DateTime? StartBooking;
  final DateTime? EndBooking;
  final String? Location;
  final String? Type;
  final String? Level;
  final int? Sublimit;
  final int? Cost;
  final String? Description;
  final String? Retrieve;
  final String? Requirements;
  final int? Rate;
  final String? TripPhoto;
  final DateTime? RetrieveEndDate;
  final int? Percent;

  const TripDetailScreen({
    Key? key,
    this.id,
    this.team_id,
    this.Title,
    this.StartDate,
    this.EndDate,
    this.StartBooking,
    this.EndBooking,
    this.Location,
    this.Type,
    this.Level,
    this.Sublimit,
    this.Cost,
    this.Description,
    this.Retrieve,
    this.Requirements,
    this.Rate,
    this.TripPhoto,
    this.RetrieveEndDate,
    this.Percent,
    this.TeamName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 770,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(55),
                      bottomRight: Radius.circular(55))),
              child: Column(
                children: [
                  TripDetailsPic(
                    coverPic:
                        "https://i.pinimg.com/736x/e8/2b/e4/e82be4f7f891766ec7c0b0230cb292f4.jpg",
                    title: "$Title",
                    // pics: [],
                    place: Location!,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        MainInfoRow(
                          teamName: TeamName!,
                          type: Type!,
                          level: Level!,
                          startDate: StartDate!,
                          endDate: EndDate!,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DescriptionText(description: Description!),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(bottom: 0, child: EnrollBar(cost: Cost!)),
          ],
        ),
      ),
    );
  }
}
