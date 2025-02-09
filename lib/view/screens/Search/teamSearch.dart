import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JustTour/controller/Team%20Controllers/showTeamsController.dart';
import 'package:JustTour/controller/Trips%20Controller/showTripsController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/dataSource/statics/static.dart';
import 'package:JustTour/data/model/team_model.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/screens/TeamUI/myTripDetails.dart';
import 'package:JustTour/view/screens/Teams/teamsDetails.dart';

class TeamSearchScreen extends StatefulWidget {
  const TeamSearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TeamSearchScreen> createState() => _TeamSearchScreen();
}

late Future<List<TeamModel>?> teams;

@override
void initState() {
  teams = ShowTeamsController().getTeams();
}

class _TeamSearchScreen extends State<TeamSearchScreen> {
  String searchValue = '';
  @override
  void updateList(BuildContext context, String value) {
    setState(() {
      searchValue = value;
    });
  }

  Widget build(BuildContext context) {
    teams = ShowTeamsController().getTeams();

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.midnightGreen,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.midnightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.midnightGreen,
                      offset: Offset(0.0, 0.1),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) => updateList(context, value),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.midnightGreen,
                          size: 20,
                        ),
                        hintText: "Search for a Team"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<TeamModel>?>(
              future: teams,
              builder: (context, AsyncSnapshot<List<TeamModel>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  List<TeamModel> filteredTeams = snapshot.data!
                      .where((team) => team.TeamName!
                          .toLowerCase()
                          .contains(searchValue.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    itemCount: filteredTeams.length,
                    itemBuilder: (context, index) {
                      TeamModel team = filteredTeams[index];
                      return InkWell(
                        onTap: () {
                          Get.to(
                              TaemsDetailsScreen(
                                id: team.team_id,
                              ),
                              arguments: team);
                        },
                        child: Container(
                          child: ListTile(
                            title: Text(team.TeamName!),
                            subtitle: Text("${team.TeamName!}"),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
