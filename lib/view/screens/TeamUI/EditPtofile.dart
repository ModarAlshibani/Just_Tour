import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:terez/controller/ProfileControllers/teamProfileController.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terez/data/model/team_model.dart';
import 'package:terez/view/widgets/TeamUI/editField.dart';

class EditProfile extends StatefulWidget{
  
  const EditProfile({super.key});
  
  @override
  State<EditProfile> createState() => _EditProfileState();
}

late Future<TeamModel?> team;

class _EditProfileState extends State<EditProfile> {
  @override
  void initState(){
    team = TeamProfileControllerImp().getCurrentTeamProfile();
  }

  Uint8List? _image;

  pickImage(ImageSource source) async{
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if(_file != null){
      return await _file.readAsBytes();
    }
    print("No Images Selected");
  }

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    },);
  }

  Widget build(BuildContext context){

    TeamProfileControllerImp controller = Get.put(TeamProfileControllerImp());
    team = TeamProfileControllerImp().getCurrentTeamProfile();
    

    return WillPopScope(
       onWillPop: () async {
        Navigator.of(context).pushReplacementNamed('/teamNav');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: FutureBuilder<TeamModel?>(
          future: team,
          builder: (context, teamInfo){
            if(teamInfo.hasData){
              return getTeamProfile(teamInfo);
            } else if(teamInfo.hasError){
              return Text("${teamInfo.error}");
            } else{
              return const Center(child:CircularProgressIndicator() );
            }
          } ,
        ),
      ),
    );
  }
}

TeamProfileControllerImp controller = Get.put(TeamProfileControllerImp());
Widget getTeamProfile(AsyncSnapshot<TeamModel?> teamInfo) =>
Stack(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: AppColors.midnightGreen,
            ),
          ),
          Positioned(
            top: 45,
            right: 15,
            child: MaterialButton(
              onPressed: (){print("bgggh");
              controller.EditTeamProfile();},
              child: Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 97, 60),
                  borderRadius: BorderRadius.circular(10,),
                ),
                child: Center(
                  child: Text("Save",
                  style: TextStyle(
                    color: AppColors.whiteSmoke,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.language,
                  ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Stack(
                  //   alignment: AlignmentDirectional.center,
                  //   children: [
                  //     CircleAvatar(
                  //       radius: 73,
                  //       backgroundColor: AppColors.whiteSmoke,
                  //     ),
                  //     _image != null ?
                  //     CircleAvatar(
                  //       radius: 70,
                  //       backgroundImage: MemoryImage(_image!),
                  //     ):
                  //     CircleAvatar(
                  //       radius: 70,
                  //       backgroundImage: AssetImage(imageAsset.camping),
                  //     ),
                  //     Positioned(
                  //       bottom: 0,
                  //       right: 0,
                  //       child: CircleAvatar(
                  //         radius: 20,
                  //         backgroundColor: AppColors.whiteSmoke,
                  //         child: IconButton(
                  //           onPressed: selectImage,
                  //           icon: Icon(
                  //             Icons.edit,
                  //             color: AppColors.varidiantGreen,
                  //           ),
                  //           ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 60,
                    child: Center(
                      child: Text(
                        "${teamInfo.data?.TeamName}",
                        maxLines: 2,
                      style: TextStyle(
                        color: AppColors.whiteSmoke,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300, left: 20, right: 20,),
            child: Container(
              width: double.infinity,
              height: 540,
              decoration: BoxDecoration(
                color: AppColors.whiteSmoke,
                borderRadius: BorderRadius.circular(10,),
                boxShadow: [
                                BoxShadow(
                                  color: AppColors.midnightGreen,
                                  offset: Offset(0.0, 0.1),
                                  blurRadius: 1.0,
                                ),
                              ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                      child: EditField(
                        initialText: "${teamInfo.data?.TeamName}", 
                        leadingIcon: Icon(Icons.groups), )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                      myController: controller.Description,
                      initialText: "${teamInfo.data?.Description}", 
                      leadingIcon: Icon(Icons.info_outline),)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                      myController: controller.ContactInfo,
                      initialText: "${teamInfo.data?.ContactInfo}", leadingIcon: Icon(Icons.phone),)
                    ),Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                      initialText: "${teamInfo.data?.Email}", 
                      leadingIcon: Icon(Icons.email_outlined), )
                    ),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      );