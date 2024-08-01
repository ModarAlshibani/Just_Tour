import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/view/screens/Search/teamSearch.dart';
import 'package:terez/view/screens/Teams/teamsDetails.dart';
import 'package:terez/view/widgets/Teams/teamOutside.dart';

class teamsScreen extends StatelessWidget {
  const teamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: TeamsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(
                        taemsDetails(
                          teamName: TeamsList[index].teamName,
                          teamPic:  TeamsList[index].teamPic!, 
                          description: TeamsList[index].description!, 
                        ),
                      );

                    },
                    child: TeamItem(
                      teamName: TeamsList[index].teamName!, 
                      teamPic:TeamsList[index].teamPic!, 
                      description: TeamsList[index].description!, 
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}