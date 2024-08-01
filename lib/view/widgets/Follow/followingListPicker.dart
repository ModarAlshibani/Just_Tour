import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/view/widgets/Follow/teamsFollowedList.dart';

class FollowingListPicker extends StatefulWidget{
  final Function(bool) updateShow;

  FollowingListPicker({required this.updateShow});

  @override
  State<FollowingListPicker> createState() => _FollowingListPickerState();
}

class _FollowingListPickerState extends State<FollowingListPicker> {

  Color Color1 = AppColors.whiteSmoke;
  Color Color2 = Color.fromARGB(255, 188, 188, 188);
  


  void _teamsPressed(){
  setState(() {
      Color1 = AppColors.whiteSmoke;
      Color2 = Color.fromARGB(255, 188, 188, 188);
      widget.updateShow(true);
    });
  }
  void _sitesPressed(){
  setState(() {
      Color2 = AppColors.whiteSmoke;
      Color1 = Color.fromARGB(255, 188, 188, 188);
      widget.updateShow(false);
    });
  }

  @override
  Widget build(BuildContext context){

    return Row( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        _teamsPressed();
                       },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color1,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                        ),
                        child: Center(
                          child: Text("Teams", 
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15, color: AppColors.midnightGreen, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40,),
                    MaterialButton(
                      onPressed: () {
                        _sitesPressed();
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Color2,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                          ),
                          child: Center(
                            child: Text("Sites", 
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15, color: AppColors.midnightGreen, fontWeight: FontWeight.w700),
                            ),
                          ),
                          ),
                    ),
                  ],
                );
  }
}