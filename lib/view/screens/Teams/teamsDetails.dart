import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Team%20Controllers/showTeamsController.dart';
import 'package:JustTour/controller/Trips%20Controller/showTripsController.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/team_model.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/Teams/followingController.dart';
import 'package:JustTour/view/screens/Trips/tripDetailsScreenUser%20(2).dart';
import 'package:JustTour/view/widgets/Teams/teamDet.dart';

class TaemsDetailsScreen extends StatefulWidget {
  final int? id;

  const TaemsDetailsScreen({
    super.key,
    this.id,
  });

  @override
  State<TaemsDetailsScreen> createState() => _taemsDetailsState();
}

late Future<TeamModel?> team;
late Future<List<TripModel>?> teamTrips;

class _taemsDetailsState extends State<TaemsDetailsScreen> {
  @override
  void initState() {
    team = ShowTeamsController().userGetTeamDetails(widget.id);
    teamTrips = TripController().userGetTeamTrips(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    team = ShowTeamsController().userGetTeamDetails(widget.id);
    teamTrips = TripController().userGetTeamTrips(widget.id);

    ScrollController _scrollController = ScrollController();
    print(
        "================================================================================");
    print(widget.id);
    print(
        "================================================================================");

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        children: [
          FutureBuilder<TeamModel?>(
            future: team,
            builder: (context, teamInfo) {
              if (teamInfo.hasData) {
                return getTeamDetails(teamInfo);
              } else if (teamInfo.hasError) {
                return Text(' ${teamInfo.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          FutureBuilder<List<TripModel>?>(
            future: teamTrips,
            builder: (context, tripInfo) {
              if (tripInfo.hasData) {
                return TeamTripsList(tripInfo);
              } else if (tripInfo.hasError) {
                return Text(' ${tripInfo.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget TeamTripsList(AsyncSnapshot<List<TripModel>?> tripInfo) => Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          height: 220,
          width: 500,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tripInfo.data?.length ?? 0,
              itemBuilder: (context, index) {
                TripModel? trip = tripInfo.data![index];

                return InkWell(
                  onTap: () {
                    Get.to(
                        TripDetailsScreenUser(
                          id: trip.id,
                        ),
                        arguments: trip);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('sss'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.midnightGreen,
                                offset: Offset(0.0, 0.1),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            trip!.Title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );

Widget getTeamDetails(AsyncSnapshot<TeamModel?> teamInfo) => Stack(
      children: [
        Container(
          height: 500,
          width: 500,
          color: Color.fromARGB(255, 219, 219, 219),
        ),
        Column(
          children: [
            TeamDet(
              teamName: teamInfo.data?.TeamName,
              Rate: teamInfo.data?.Rate?.toDouble(),
              teamPic: teamInfo.data?.ProfilePhoto,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.midnightGreen,
                    offset: Offset(0.0, 0.1),
                    blurRadius: 2.0,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 280,
              width: double.infinity,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "  Description:",
                        style: TextStyle(
                            color: AppColors.midnightGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      child: Text(
                        "${teamInfo.data?.Description}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "  Contact Info:",
                        style: TextStyle(
                            color: AppColors.midnightGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, bottom: 10, right: 10),
                      child: Text(
                        "${teamInfo.data?.ContactInfo}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 50,
          right: 20,
          child: InkWell(
            onTap: () {
              if (Get.find<GlobalStateController>().getTeamIsFollowed() ==
                  false) {
                FollowTeamControllerImp().Follow(teamInfo.data?.team_id);
                print("false");
              } else if (Get.find<GlobalStateController>()
                      .getTeamIsFollowed() ==
                  true) {
                FollowTeamControllerImp().UnFollow(teamInfo.data?.team_id);
                print("True ........... UNFOLLOW");
              }
            },
            child: Container(
              width: 90,
              height: 35,
              decoration: BoxDecoration(
                  color: Get.find<GlobalStateController>().getTeamIsFollowed()
                      ? Colors.white
                      : AppColors.orange,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  Get.find<GlobalStateController>().getTeamIsFollowed()
                      ? 'Unfollow'
                      : 'Follow',
                  style: TextStyle(
                      color:
                          Get.find<GlobalStateController>().getTeamIsFollowed()
                              ? AppColors.orange
                              : Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
