import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';

class LogPicker extends StatefulWidget {
  final Function(bool) updateShow;

  LogPicker({required this.updateShow});

  @override
  State<LogPicker> createState() => _LogPicker();
}

class _LogPicker extends State<LogPicker> {
  Color Color1 = AppColors.whiteSmoke;
  Color Color2 = Color.fromARGB(255, 188, 188, 188);

  void _upComming() {
    setState(() {
      Color1 = AppColors.whiteSmoke;
      Color2 = Color.fromARGB(255, 188, 188, 188);
      widget.updateShow(true);
    });
  }

  void _isFinished() {
    setState(() {
      Color2 = AppColors.whiteSmoke;
      Color1 = Color.fromARGB(255, 188, 188, 188);
      widget.updateShow(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            _upComming();
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: Color1,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Center(
              child: Text(
                "Upcomming trips",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.midnightGreen,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        MaterialButton(
          onPressed: () {
            _isFinished();
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: Color2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Center(
              child: Text(
                "Finished trips",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    color: AppColors.midnightGreen,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
