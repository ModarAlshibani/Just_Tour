import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Team%20Controllers/showTeamsController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/team_model.dart';
import 'package:JustTour/view/screens/Search/teamSearch.dart';
import 'package:JustTour/view/screens/Teams/teamsDetails.dart';

class teamsScreen extends StatefulWidget {
  const teamsScreen({super.key});

  @override
  State<teamsScreen> createState() => _teamsScreenState();
}

late Future<List<TeamModel>?> teamsList;

@override
void initState() {
  teamsList = ShowTeamsController().getTeams();
}

class _teamsScreenState extends State<teamsScreen> {
  @override
  Widget build(BuildContext context) {
    teamsList = ShowTeamsController().getTeams();

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/nav');
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.midnightGreen,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  left: 30,
                ),
                child: Text(
                  "Teams",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: AlignmentDirectional.topStart,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 188, 188, 188),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(TeamSearchScreen());
                      null;
                    },
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: AppColors.varidiantGreen,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteSmoke,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 180,
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteSmoke,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: FutureBuilder<List<TeamModel>?>(
                    future: teamsList,
                    builder: (context, teamInfo) {
                      if (teamInfo.hasData) {
                        return getTeam(teamInfo);
                      } else if (teamInfo.hasError) {
                        return Text('${teamInfo.error}');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getTeam(AsyncSnapshot<List<TeamModel>?> teamInfo) => ListView.builder(
    padding: EdgeInsets.all(10),
    itemCount: teamInfo.data?.length ?? 0,
    scrollDirection: Axis.vertical,
    itemBuilder: (BuildContext context, int index) {
      TeamModel team = teamInfo.data![index];
      String? pic = team.ProfilePhoto;

      return InkWell(
        onTap: () {
          print("${team.team_id}");
          print("6666666666666666666666");
          Get.to(
            () => TaemsDetailsScreen(
              id: team.team_id,
            ),
            arguments: team,
          );
          print("6666666666666666666666");
        },
        child: Stack(
          children: [
            Container(
              width: 390,
              height: 150,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.midnightGreen,
                    offset: Offset(0.0, 0.1),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          team.TeamName!,
                          softWrap: false,
                          style: TextStyle(
                            color: AppColors.midnightGreen.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(pic!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Container(
                              //color: Colors.white,
                              width: 220,
                              height: 70,
                              child: Text(
                                team.Description!,
                                // softWrap: false,
                                style: TextStyle(
                                  color: AppColors.blackCurrant,
                                  fontSize: 13,
                                ),
                                maxLines: 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
