import 'package:get/get.dart';
import 'package:JustTour/view/screens/TeamUI/teamNavbar.dart';
import 'package:JustTour/view/screens/Trips/EnrollementScreen%20(2).dart';
import 'package:JustTour/view/screens/auth/forget_password/emailVerfiy.dart';
import 'package:JustTour/view/screens/auth/forget_password/forgetPassword.dart';
import 'package:JustTour/view/screens/auth/login.dart';
import 'package:JustTour/view/screens/auth/signup.dart';
import 'package:JustTour/view/screens/homePage/homepage.dart';
import 'package:JustTour/view/screens/navbar.dart';
import 'package:JustTour/view/screens/onBoarding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/onBoarding", page: () => const OnBoarding()),
  GetPage(name: "/signup1", page: () => const SignUp1()),
  GetPage(name: "/homePage", page: () => const HomePage()),
  GetPage(name: "/forgetPassword", page: () => const ForgetPassword()),
  GetPage(name: "/emailVerfiy", page: () => const EmailVerfiy()),
  GetPage(name: "/nav", page: () => Navbar()),
  GetPage(name: "/teamNav", page: () => TeamNavbar()),
  GetPage(name: "/enrollementScreen", page: () => const EnrollementScreen()),
];
