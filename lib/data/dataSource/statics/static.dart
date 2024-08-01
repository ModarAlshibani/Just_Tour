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
      placeId: 1,
      name: "Kassab Forest",
      location: "Lattakia",
      description:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      coverPic:
          "https://i.pinimg.com/474x/62/d2/50/62d2509441af0cf7a9deeb398e9cc8c1.jpg",
      pics: [
        "https://i.pinimg.com/474x/62/d2/50/62d2509441af0cf7a9deeb398e9cc8c1.jpg",
        "https://i.pinimg.com/474x/0f/12/77/0f1277c4b648d819895486538c3e254e.jpg",
        "https://i.pinimg.com/474x/e9/6b/63/e96b63728f6cef7e0653cbfb95385a35.jpg",
      ]),
  PlaceModel(
      placeId: 1,
      name: "Palmyra",
      location: "Homs",
      description:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations.very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      coverPic:
          "https://i.pinimg.com/564x/23/da/eb/23daeb5f4f20b6526a63766a8df14acd.jpg",
      pics: [
        "https://i.pinimg.com/564x/72/38/bd/7238bdbef53a45b0361b9dd306707f35.jpg",
        "https://i.pinimg.com/564x/26/0d/2a/260d2ab6ad53650464f973652f42b7dd.jpg",
        "https://i.pinimg.com/564x/bc/6e/3b/bc6e3b2514fdab6eb5c944bfd56fac00.jpg",
        "https://i.pinimg.com/564x/8b/9d/8a/8b9d8a513dfebbddc331adc0a5c7ee17.jpg",
        "https://i.pinimg.com/564x/f0/ef/b1/f0efb1bfca75a0c43f0b824138a5f39a.jpg"
      ]),
  PlaceModel(
      placeId: 1,
      name: "Damascus Umayyad Mosque",
      location: "Damascus",
      description:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      coverPic:
          "https://i.pinimg.com/474x/fa/7f/0d/fa7f0dfaea7c2e5584d1ec8d1fb8fa68.jpg",
      pics: [
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/eb/32/93/an-amazing-place-to-visit.jpg?w=1000&h=-1&s=1",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/9e/7e/ea/photo0jpg.jpg?w=1400&h=-1&s=1",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/7a/9c/61/umayyad-mosque.jpg?w=700&h=-1&s=1",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/7a/9b/b3/umayyad-mosque.jpg?w=2000&h=-1&s=1",
        "https://i.pinimg.com/474x/fa/7f/0d/fa7f0dfaea7c2e5584d1ec8d1fb8fa68.jpg",
      ]),
  PlaceModel(
      placeId: 1,
      name: "Hama Waterwheels",
      location: "Hama",
      description:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      coverPic:
          "https://i.pinimg.com/474x/c0/f5/8b/c0f58b2abe4220df1077c0b3a37c1864.jpg",
      pics: [
        "https://i.pinimg.com/474x/7e/79/97/7e7997b95bb1bfcbde4f784f5214d28f.jpg",
        "https://i.pinimg.com/474x/c7/45/a1/c745a143de396896164323e0b56fec40.jpg",
        "https://i.pinimg.com/474x/1e/a3/6a/1ea36a1de3f463e36176adc4aea8d6d4.jpg",
        "https://i.pinimg.com/474x/cd/e0/bf/cde0bf8f41148d016dee60ab0847432b.jpg"
      ]),
  PlaceModel(
      placeId: 1,
      name: "The old city of Damascus",
      location: "Damascus",
      description:
          "very attractive mountine resort in the coastal mountains about an hour away from Lattakia. the town has armenian populations. the surrounding forests represents an example of a virgin mediterranean forest. from april until November is the best time to visit, in the summer months it is full of Arab tourists. full of cafe's and restaurants..nice to see where the Syrians spend their summers. the other pretty resort in the area is Slunfe' that was built by the french.",
      coverPic:
          "https://i.pinimg.com/474x/4f/7f/5c/4f7f5ccbec4d55644551e52710e7b7b5.jpg",
      pics: [
        "https://i.pinimg.com/474x/23/b0/d6/23b0d611f9f7a6e10ce037de46613016.jpg",
        "https://i.pinimg.com/474x/7d/cd/95/7dcd95c738b0c46c52b1eee0fc70185e.jpg",
        "https://i.pinimg.com/474x/4e/67/37/4e67378e0fe086edba101c661e85dd69.jpg",
        "https://i.pinimg.com/474x/4f/7f/5c/4f7f5ccbec4d55644551e52710e7b7b5.jpg",
        "https://i.pinimg.com/474x/0e/df/72/0edf724423751e3b540c0dadd58eb08c.jpg",
        "https://i.pinimg.com/474x/a6/a2/54/a6a2547950f81f350885a1b76850f587.jpg",
      ]),
];

List<TeamModel> TeamsList = [
  TeamModel(
      teamName: "Duroub",
      description:
          "Duroub team is a non-utilitarian team, its goal is descovering nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.41vddd6AHgcIFxOVThiAyQHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Go Syrian",
      description:
          "Go Syrian team is a non-utilitarian team, its goal is descovering nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.MkSlx259bDv2Pltg-EmoXgHaIe&w=233&h=267&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Travel",
      description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Travel",
      description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Travel",
      description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Travel",
      description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Travel",
      description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
  TeamModel(
      teamName: "Travel",
      description:
          "Travel Syrian team is a utilitarian team, its goal is relax in nature",
      teamPic:
          "https://th.bing.com/th?id=OIP.lJUuv6EY3MeP27IgF4bg2gHaH6&w=241&h=258&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2"),
];
