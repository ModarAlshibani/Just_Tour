import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:JustTour/core/constant/appColors.dart';

class AddTripField extends StatelessWidget {
  final String? initialText;
  final Icon? leadingIcon;
  final TextEditingController? myController;

  const AddTripField({
    super.key,
    this.initialText,
    this.leadingIcon,
    this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: leadingIcon,
          focusColor: AppColors.midnightGreen,
          hoverColor: AppColors.midnightGreen,
          prefixIconColor: AppColors.midnightGreen,
          hintText: '$initialText',
        ),
        controller: myController,
      ),
    );
  }
}
