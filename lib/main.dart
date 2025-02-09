import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:JustTour/Bindings/initialBinding.dart';
import 'package:JustTour/Networking/firebase_notifications.dart';
import 'package:JustTour/controller/auth/Token.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/localization/changeLocalController.dart';
import 'package:JustTour/core/localization/translation.dart';
import 'package:JustTour/core/services/services.dart';
import 'package:JustTour/firebase_options.dart';
import 'package:JustTour/routes.dart';
import 'package:JustTour/view/screens/onBoarding.dart';

void main() async {
  Get.put(GlobalStateController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await initServices();
  await FirebaseNotifications().initNotifications();
  runApp(const MyApp());
}

// Future<String?> postRating() async {
//   Dio dio = Dio();
//   if (dio == null) {
//     BaseOptions options = new BaseOptions(
//         baseUrl: "your base url",
//         receiveDataWhenStatusError: true,
//         connectTimeout: Duration(seconds: 60), // 60 seconds
//         receiveTimeout: Duration(seconds: 60) // 60 seconds
//         );

//     dio = new Dio(options);
//   }
//   print("BTTTTTTTTTTTTT");

//   print("BT");
//   try {
//     print("try");
//     var response = await dio.post(
//       'http://10.0.2.2:8000/api/getTrip',
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization':
//             'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzE5MzQyMTEyLCJleHAiOjE3MTkzNDU3MTIsIm5iZiI6MTcxOTM0MjExMiwianRpIjoiSDNyN0lYbW0zSEpvYVBkdyIsInN1YiI6IjEiLCJwcnYiOiI4YjJjNDJkY2QwM2JlNjBmMzY1NDM0NzcwMDQ1NTUzMmE1OGE2MDVhIn0.AF2onhRNLqC4l70qIvs6ztA2LiP9VrGEn36b0A7LxjM',
//       }),
//       data: {'TripId': 1},
//     );

//     print("Response received");
//     print(response.data);

//     if (response.statusCode == 200) {
//       print("Success");
//       // Assuming you want to return some data or a custom model here
//       return "Success"; // Replace with actual data or model
//     } else {
//       print("Error");
//       // Handle error appropriately
//       throw Exception('Failed to post rating');
//     }
//   } catch (e) {
//     print(e);
//     throw e;
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());

    Future<bool> isFirstLaunch() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstTime = prefs.getBool('first_time') ?? true;

      if (isFirstTime) {
        await prefs.setBool('first_time', false);
        return true; // It's the first time
      } else {
        return false; // Not the first time
      }
    }

    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      getPages: routes,
      initialBinding: initialBindings(),
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 30,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.bold,
              color: AppColors.rumSwizzle),
          bodyMedium: TextStyle(
              fontSize: 14,
              color: AppColors.rumSwizzle,
              fontFamily: 'Merriweather',
              fontWeight: FontWeight.w400),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
