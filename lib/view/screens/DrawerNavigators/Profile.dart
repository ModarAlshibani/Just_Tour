import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terez/controller/ProfileControllers/userProfileController.dart';
import 'package:terez/controller/auth/Token.dart';
import 'package:terez/core/constant/appColors.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/core/shared/widgets/backButton.dart';
import 'package:terez/data/model/userModel.dart';
import 'package:terez/view/widgets/TeamUI/AddTripField.dart';
import 'package:terez/view/widgets/TeamUI/editField.dart';

class Profile extends StatefulWidget{

  const Profile({super.key,});

  @override
  State<Profile> createState() => _ProfileState();
}

late Future<User?> user;

class _ProfileState extends State<Profile> {
  @override
  void initState(){
    user = UserControllerImp().getCurrentUserProfile();
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
  @override
  Widget build(BuildContext context){
    
    UserControllerImp controller = Get.put(UserControllerImp());
    user = UserControllerImp().getCurrentUserProfile();
  
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: FutureBuilder<User?>(
        future: user,
        builder: (context, userInfo) {
          if(userInfo.hasData){
            return getUserProfile(userInfo);
          } else if(userInfo.hasError){
            return Text("${userInfo.error}");
          } else{
            return const Center(child:CircularProgressIndicator() );
          }
        },
      ),
    );
  }
}

    UserControllerImp controller = Get.put(UserControllerImp());
Widget getUserProfile(AsyncSnapshot<User?> userInfo) =>
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
              controller.EditUserProfile();},
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
           Positioned(
            top: 45, left: 20,
            child: backButton()),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      // CircleAvatar(
                      //   radius: 73,
                      //   backgroundColor: AppColors.whiteSmoke,
                      // ),
                      // _image != null ?
                      // CircleAvatar(
                      //   radius: 70,
                      //   backgroundImage: MemoryImage(_image!),
                      // ):
                      // CircleAvatar(
                      //   radius: 70,
                      //   backgroundImage: AssetImage(imageAsset.camping),
                      // ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: CircleAvatar(
                      //     radius: 20,
                      //     backgroundColor: AppColors.whiteSmoke,
                      //     child: IconButton(
                      //       onPressed: selectImage,
                      //       icon: Icon(
                      //         Icons.edit,
                      //         color: AppColors.varidiantGreen,
                      //       ),
                      //       ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 60,
                    child: Center(
                      child: Text(
                        "${userInfo.data?.FirstName} ${userInfo.data?.LastName}",
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
                        initialText: "${userInfo.data?.FirstName}", 
                        leadingIcon: Icon(Icons.person_2_outlined), 
                        myController: controller.FirstName,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                        initialText: "${userInfo.data?.LastName}", 
                        leadingIcon: Icon(Icons.person_2_outlined), 
                        myController: controller.LastName,
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                        initialText: "${userInfo.data?.Email}", 
                        leadingIcon: Icon(Icons.email_outlined), )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: EditField(
                        initialText: "${userInfo.data?.Number}", 
                        leadingIcon: Icon(Icons.phone),
                        myController: controller.Number,
                        )
                    ),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      );