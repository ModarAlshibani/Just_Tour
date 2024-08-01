import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/data/dataSource/statics/static.dart';
import 'package:terez/data/model/team_model.dart';
import 'package:terez/data/model/trip_model.dart';

import 'package:terez/view/screens/Teams/teamsScreen.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen ({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<TeamModel> display_list = List.from(TeamsList);

  void updateList(String value) {
    setState(() { 
      display_list = TeamsList.where(
        (element) => element.teamName!.toLowerCase().contains(value.toLowerCase()) 
        ).toList();
        
    });
  }
  @override

  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.midnightGreen,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10 , left: 20,),
          child: IconButton(         
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
            color: Colors.white,),
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
                height: 150 ,
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
                  margin: EdgeInsets.only(top: 40,),
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) => updateList(value), 
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
                        size: 20,),
                      hintText: "Search for a team"
                    ),
                  ),
                 ),
               ),
            ],
          ),
          Expanded(
            child: display_list.length == 0 ? Center(
                  child: Text(
                    "No results found!",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.blackCurrant,
                    ),
                    ))
                    : Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                      child: ListView.builder(
                                    itemCount: display_list.length,
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        ListTile(
                                          contentPadding: EdgeInsets.all(8),
                                          title: Text(
                                            display_list[index].teamName!,
                                            style: TextStyle(
                                                              color: AppColors.blackCurrant,
                                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          
                                        leading: Image.network(display_list[index].teamPic!),
                                          
                                        ),
                                        Container(
                      height: 0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(68, 17, 81, 96),
                        ),
                      ),
                    ),
                                      ],
                                    ),
                                    ),
                    )
                   ), 
              
              
          ],
      ),
    );
  }
}