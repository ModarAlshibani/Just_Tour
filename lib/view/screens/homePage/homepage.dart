import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:terez/controller/Team%20Controllers/showTeamsController.dart';
import 'package:terez/controller/Trips%20Controller/showTripsController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/data/model/team_model.dart';
import 'package:terez/data/model/trip_model.dart';
import 'package:terez/view/screens/Search/homepageSearch.dart';
import 'package:terez/view/screens/Teams/teamsDetails.dart';
import 'package:terez/view/screens/Teams/teamsScreen.dart';
import 'package:terez/view/screens/Trips/tripDetailsScreenUser%20(2).dart';
import 'package:terez/view/widgets/HomePage/drawer.dart';
import 'package:terez/view/widgets/HomePage/teamsCircle.dart';
//import 'package:terez/view/widgets/Teams/tripsList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
 late Future<List<TeamModel>?> teamsList;
 late Future<List<TripModel>?> trips;

@override
void initState() {
  teamsList = ShowTeamsController().getTeams();
  trips = TripController().getallTrips();
}


class _HomePageState extends State<HomePage> {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    teamsList = ShowTeamsController().getTeams(); 
    trips = TripController().getallTrips();

    ScrollController _scrollController = ScrollController();

    return WillPopScope(
       onWillPop: () async {
       final result = await showDialog( 
        context: context, 
        builder: (context) => AlertDialog(  backgroundColor: AppColors.grey,
      title: const Text('Exit App'),
      content: const Text('Are you sure you want to exit the app?', 
      style: TextStyle(color: AppColors.blackCurrant),),
      actions: <Widget>[
        TextButton(
          child: const Text('No',style: TextStyle(color: AppColors.blackCurrant),),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: const Text('Yes' ,style: TextStyle(color: AppColors.blackCurrant),),
          onPressed: () => SystemNavigator.pop(),
        ),
      ],
    ),
        );
        return result == true;
},
      child: Scaffold(
        key: _scaffoldKey,
        drawer: new MyDrawer(),
        body: Stack(
          children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: AlignmentDirectional.topStart,
            decoration: BoxDecoration(
              color: AppColors.midnightGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    _scaffoldKey.currentState!.openDrawer();
                  },
                    icon: Icon(
                      Icons.menu,
                      size: 40,
                      color: AppColors.whiteSmoke,
                    ),
                    ),
                  SizedBox(width: 5,),
                  Container(
                    height: 55,
                    width: 290,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(HomepageSearchScreen());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 40,
                            color: AppColors.varidiantGreen,
                          ),
                          SizedBox(width: 10,),
                          Text("Search",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.whiteSmoke,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(
                top: 140,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
      ///////////////////////////////////////////////
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all( 10),
                            child: Container(
                              height: 160,
                              width: double.infinity,
                              child: FutureBuilder<List<TeamModel>?>(
                                              future: teamsList,
                                              builder: (context, teamInfo) {
                          if (teamInfo.hasData) {
                            return getTeamsCircle(teamInfo);
                          } else if (teamInfo.hasError) {
                            return Text('${teamInfo.error}');
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                                              }),
                            ),
                          ),


                          Container(
                            width: double.infinity,
                            height: 500,
                            child: FutureBuilder<List<TripModel>?>(
                                              future: trips,
                                              builder: (context, tripInfo) {
                          if (tripInfo.hasData) {
                            return allTrips(tripInfo);
                          } else if (tripInfo.hasError) {
                            return Text('${tripInfo.error}');
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                                              }),
                          ),
                        ],
                      ),
      
      /////////////////////////////////////////////////////////                
                      
                      // Container(
                      //         height: 200,
                      //         width: double.infinity,
                             
                      //         child: ListView.builder(
                      //             controller: _scrollController,
                      //             scrollDirection: Axis.horizontal,
                      //             itemCount: tripsList.length,
                      //             itemBuilder: (context, index) {
                      //               return InkWell(
                      //                 onTap: (){Get.to(TripDetailScreen(
                      //     tripId: tripsList[index].tripId,
                      //     place: tripsList[index].place,
                      //     type: tripsList[index].type,
                      //     title: tripsList[index].title,
                      //     coverPic: tripsList[index].coverPic,
                      //     startDate: tripsList[index].startDate,
                      //     endDate: tripsList[index].startDate,
                      //     startBooking: tripsList[index].startDate,
                      //     endBooking: tripsList[index].startDate,
                      //     level: tripsList[index].level.toString(),
                      //     cost: tripsList[index].cost,
                      //     retrieve: tripsList[index].retrieve,
                      //     teamName: tripsList[index].team,
                      //     description: tripsList[index].description,
                      //     pics: tripsList[index].pics,
                      //     subLimit: tripsList[index].subLimit,
                      //   ));},
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8,),
                                        
                      //    child: TripsList(
                      //    name: tripsList[index].title,
                      //    pic: tripsList[index].coverPic,
                      //    team: tripsList[index].team,
                      //    date: tripsList[index].startDate,
                      //    place: tripsList[index].place,
                      // ),
                      //                 ),
                      //               );
                      //             }),
                      //       ),
                    ],
                  ),
                ),
                ),),
          ],
        ),
      ),
    );
  }
}


Widget allTrips(AsyncSnapshot<List<TripModel>?> tripInfo) =>
Container(
  width: double.infinity,
  height: 200 * (tripInfo.data?.length ?? 0).toDouble() ,
  child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: tripInfo.data?.length ?? 0,
    scrollDirection: Axis.vertical,
    
    itemBuilder: (BuildContext context, int index) {
          TripModel? trip = tripInfo.data![index];
          String? pic = trip?.TripPhoto; 
          return InkWell(
            onTap: () {
              Get.to(
                () => TripDetailsScreenUser(
                  id: trip?.id,
                ),
                arguments: trip,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.midnightGreen.withOpacity(0.3)),
              width: 320,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    width: 320,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(pic!), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  )),
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
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        trip!.Title!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 40,
                    child: Text(
                      "${trip.StartDate!.day}/${trip.StartDate!.month}/${trip.StartDate!.year}",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 10,
                    child: Text(
                      "${trip.Cost} S.p",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
  ),
);













Widget getTeamsCircle(AsyncSnapshot<List<TeamModel>?> teamInfo) =>
    ListView.builder( 
        padding: EdgeInsets.all(10),
        itemCount: teamInfo.data?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          TeamModel team = teamInfo.data![index];
          String? pic = team.ProfilePhoto;
          bool isFollowing = false;

          return InkWell(
            onTap: (){  print(team.TeamName);
            Get.to(
              () => TaemsDetailsScreen(
                 id: team.team_id,
              ),
              arguments: team,
            );
            },
            child: Column(
              children: [
                Padding(
                            padding: const EdgeInsets.only(left: 7, right: 7, top: 9),
                              child: CircleAvatar(
                                
                                radius: 40,
                                backgroundColor: AppColors.midnightGreen,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 38,
                                  backgroundImage: NetworkImage("${team!.ProfilePhoto}"),
                                ),
                              ),
                              ),
                            ),
                            SizedBox(height: 8,),
                            Container(
                            height: 42,
                            width: 70,
                            child: Center(
                              child: Text(
                                "${team!.TeamName}",
                                style: TextStyle(
                                  color: AppColors.midnightGreen,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ),
              ],
            ),
          );
        });
