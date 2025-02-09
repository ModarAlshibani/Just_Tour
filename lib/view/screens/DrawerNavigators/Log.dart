import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:JustTour/APIs.dart';
import 'package:JustTour/controller/ProfileControllers/LogController.dart';
import 'package:JustTour/controller/Trips%20Controller/rateTripController.dart';
import 'package:JustTour/core/constant/appColors.dart';
import 'package:JustTour/data/model/trip_model.dart';
import 'package:JustTour/view/widgets/Log/LogPicker.dart';

class Log extends StatefulWidget {
  @override
  State<Log> createState() => _Log();
}

late Future<List<TripModel>?> logList;
String status = "upComming";
RateControllerImp rateControllerImp = Get.put(RateControllerImp());

@override
void initState() {
  logList = LogController().getLog();
}

class _Log extends State<Log> {
  bool show = true;
  void updateShow(bool value) {
    setState(
      () {
        show = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    logList = LogController().getLog();

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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.grey,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "My Log",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(fontSize: 20),
                    ),
                  ),
                ],
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
                padding: const EdgeInsets.only(top: 16, left: 50),
                child: LogPicker(updateShow: updateShow),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: AlignmentDirectional.topStart,
              decoration: BoxDecoration(
                color: AppColors.rumSwizzle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: FutureBuilder<List<TripModel>?>(
                  future: logList,
                  builder: (context, tripInfo) {
                    if (tripInfo.hasData) {
                      return LogWidget(tripInfo);
                    } else if (tripInfo.hasError) {
                      return Text('${tripInfo.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}

Widget LogWidget(AsyncSnapshot<List<TripModel>?> tripInfo) => ListView.builder(
    padding: EdgeInsets.all(10),
    itemCount: tripInfo.data?.length ?? 0,
    scrollDirection: Axis.vertical,
    itemBuilder: (BuildContext context, int index) {
      TripModel trip = tripInfo.data![index];
      String imgP = trip.TripPhoto!;
      print(imgP);

      return Stack(
        children: [
          Container(
            width: 390,
            height: 150,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.midnightGreen,
                  offset: Offset(0.0, 0.1),
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(API.server + imgP),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trip.Title!,
                          // softWrap: false,
                          style: TextStyle(
                            color: AppColors.blackCurrant,
                            fontSize: 18,
                          ),
                          maxLines: 3,
                        ),
                        Text(
                          trip.TeamName!,
                          // softWrap: false,
                          style: TextStyle(
                            color: AppColors.blackCurrant,
                            fontSize: 18,
                          ),
                          maxLines: 3,
                        ),
                        RatingBar.builder(
                          initialRating: trip.Rate!.toDouble(),
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 30,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            rateControllerImp.Rate(trip.id!, rating.toInt());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
