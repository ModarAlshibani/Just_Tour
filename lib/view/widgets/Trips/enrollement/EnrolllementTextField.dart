import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';

class EnrollementTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? icon;
  final String? Function(String?)? valid;
  final TextEditingController? myController;
  const EnrollementTextField(
      {super.key,
      this.label,
      this.icon,
      this.hint,
      this.myController,
      this.valid});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        validator: valid,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: const Color.fromARGB(255, 138, 138, 138)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
              child: Text(
            label!,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color.fromARGB(255, 9, 9, 9), fontSize: 18),
          )),
          prefixIcon: icon,
          prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.midnightGreen,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
