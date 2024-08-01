import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/Search/homepageSearch.dart';
import 'package:terez/view/screens/Teams/teamsDetails.dart';
import 'package:terez/view/screens/Trips/TripDetailScreen.dart';
import 'package:terez/view/widgets/HomePage/advertisement.dart';
import 'package:terez/view/widgets/HomePage/drawer.dart';
import 'package:terez/view/widgets/HomePage/teamsCircle.dart';
//import 'package:terez/view/widgets/Teams/tripsList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    ScrollController _scrollController = ScrollController();

    return Scaffold(
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
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                      child: Advertisement(),
                    ),

                     SizedBox(height: 5,),

                    Padding(
                      padding: const EdgeInsets.all( 10),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        child: ListView.builder( 
                          scrollDirection: Axis.horizontal,
                          itemCount: TeamsList.length, 
                          itemBuilder: (context, index) => 
                          InkWell(
                            onTap: () => Get.to(
                              taemsDetails(
                                teamName: TeamsList[index].teamName,
                                teamPic: TeamsList[index].teamPic, 
                                description: TeamsList[index].description)
                            ),
                            child: teamsCircle(
                              teamName: TeamsList[index].teamName!,
                              teamPic: TeamsList[index].teamPic!
                              ),
                          )),
                      ),
                    ),

                    
                    
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
    );
  }
}