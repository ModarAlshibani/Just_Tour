import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';

class AuthCustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const AuthCustomButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 12),
        onPressed: onPressed,
        color: AppColors.rumSwizzle,
        child: Text(
          text!,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 15, color: AppColors.blackCurrant),
        ),
      ),
    );
  }
}
