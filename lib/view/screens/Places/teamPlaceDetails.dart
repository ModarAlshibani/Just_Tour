import 'package:flutter/material.dart';
import 'package:JustTour/controller/Sites%20Controller/showAllSitesController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/core/constant/imageAssets.dart';
import 'package:JustTour/core/shared/widgets/backButton.dart';
import 'package:JustTour/data/model/place_model.dart';
import 'package:JustTour/view/widgets/Trips/tripDetails/Description.dart';

class TeamPlaceDetails extends StatefulWidget {
  final int id;

  const TeamPlaceDetails({super.key, required this.id});

  @override
  State<TeamPlaceDetails> createState() => _TeamPlaceDetailsState();
}

late Future<PlaceModel?> site;

class _TeamPlaceDetailsState extends State<TeamPlaceDetails> {
  @override
  void initState() {
    site = ShowSitesController().teamGetSiteDetails(widget.id);
  }

  Widget build(BuildContext context) {
    site = ShowSitesController().teamGetSiteDetails(widget.id);

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: FutureBuilder(
          future: site,
          builder: (context, siteInfo) {
            if (siteInfo.hasData) {
              return getSiteDetails(siteInfo);
            } else if (siteInfo.hasError) {
              return Text(' ${siteInfo.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget getSiteDetails(AsyncSnapshot<PlaceModel?> siteInfo) => Container(
    width: double.infinity,
    height: double.infinity,
    child: Stack(
      children: [
        Positioned.fill(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageAsset.camping), fit: BoxFit.cover)),
        )),
        backButton(),
        Positioned(
            top: 35,
            right: 30,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: null,
                child: Text("Follow"))),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(65),
                      topRight: Radius.circular(65))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      "${siteInfo.data?.SiteName}",
                      style: TextStyle(
                          color: AppColors.blackCurrant,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DescriptionText(
                      description:
                          "${siteInfo.data?.Details}\n \nLocation: ${siteInfo.data?.Location} "),
                ],
              ),
            ))
      ],
    ));
