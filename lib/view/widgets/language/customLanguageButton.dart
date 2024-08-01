import 'package:flutter/material.dart';

import 'package:terez/core/constant/appColors.dart';

class CustomLanguageButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomLanguageButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.blackCurrant,
          borderRadius: BorderRadius.circular(5)),
      width: 260,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
                color: AppColors.rumSwizzle,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
