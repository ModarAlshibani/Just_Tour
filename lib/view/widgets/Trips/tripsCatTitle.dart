import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:terez/core/constant/appColors.dart';

class CategorieName extends StatelessWidget {
  final String catName;
  const CategorieName({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        catName,
        style: TextStyle(
            color: AppColors.blackCurrant,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
