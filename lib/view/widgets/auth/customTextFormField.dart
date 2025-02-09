import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? icon;
  final String? Function(String?)? valid;
  final TextEditingController? myController;
  
  const CustomTextFormField(
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
        keyboardType:TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: AppColors.rumSwizzle),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container( 
              child: Text(
            label!,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.rumSwizzle, fontSize: 15),
          )),
          prefixIcon: icon,
          prefixIconColor: AppColors.rumSwizzle,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.paleGold, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          
        ),
        controller: myController,
      ),
    );
  }
}
