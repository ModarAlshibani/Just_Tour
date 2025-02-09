import 'package:get/get.dart';
import 'package:terez/core/constant/imageAssets.dart';
import 'package:terez/data/model/onBoardingModel.dart';
import 'package:terez/data/model/place_model.dart';
import 'package:terez/data/model/team_model.dart';
import 'package:terez/data/model/trip_model.dart';

List<onBoardingModel> onBoardingList = [
  onBoardingModel(title: "OB1".tr, imageUrl: imageAsset.onBoarding1),
  onBoardingModel(
    title: "OB2".tr,
    imageUrl: imageAsset.onBoarding2,
  ),
  onBoardingModel(
    title: "OB3".tr,
    imageUrl: imageAsset.onBoarding3,
  ),
];

List<TripModel> tripsList = [
  TripModel(
    id: 1,
    team_id: "3",
    TeamName: "Doroub",
    Title: "AL-Qadmous",

    // int? id;
    // String? team_id;
    // String? TeamName;
    // String? Title;
    // DateTime? StartDate;
    // DateTime? EndDate;
    // DateTime? StartBooking;
    // DateTime? EndBooking;
    // String? Location;
    // String? Type;
    // String? Level;
    // int? SubLimit;
    // int? Cost;
    // String? Description;
    // String? Retrieve;
    // String? Requirements;
    // int? Rate;
    // String? TripPhoto;
    // DateTime? RetrieveEndDate;
    // int? Percent;
  )
];

List<PlaceModel> placesList = [
  PlaceModel(
      id: 1,
      SiteName: "Kassab Forest",
      Location: "Lattakia",
      Details:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
    ),
  PlaceModel(
      id: 1,
      SiteName: "Palmyra",
      Location: "Homs",
      Details:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
     ),
  PlaceModel(
      id: 1,
      SiteName: "Damascus Umayyad Mosque",
      Location: "Damascus",
      Details:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      ),
  PlaceModel(
      id: 1,
      SiteName: "Hama Waterwheels",
      Location: "Hama",
      Details:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      ),
  PlaceModel(
      id: 1,
      SiteName: "The old city of Damascus",
      Location: "Damascus",
      Details:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      ),
];

List<TeamModel> TeamsList = [
  TeamModel(
      TeamName: "Duroub",
      Description:
          "Duroub team is a non-utilitarian team, its goal is descovering nature",
      ProfilePhoto:
          "https://th.bing.com/th?id=OIP.41vddd6AHgcIFxOVThiAyQHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      TeamName: "Go Syrian",
      Description:
          "Go Syrian team is a non-utilitarian team, its goal is descovering nature",
      ProfilePhoto:
          "https://th.bing.com/th?id=OIP.MkSlx259bDv2Pltg-EmoXgHaIe&w=233&h=267&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      TeamName: "Travel",
      Description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      ProfilePhoto:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      TeamName: "Travel",
      Description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      ProfilePhoto:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      TeamName: "Travel",
      Description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      ProfilePhoto:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  
];
