import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:JustTour/core/constant/appColors.dart';

class EditField extends StatelessWidget {
  final String? initialText;
  final Icon? leadingIcon;
  final TextEditingController? myController;

  const EditField({
    super.key,
    this.initialText,
    this.leadingIcon,
    this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 70,
              width: 280, //color: Colors.amber,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: leadingIcon,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: TextField(
                      cursorColor: AppColors.midnightGreen,
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: '${initialText}',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.midnightGreen,
                          ),
                        ),
                      ),
                      //   '${widget.text}',
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                      // style: TextStyle(
                      //   color: Colors.black,
                      //   fontSize: 15,
                      //   fontWeight: FontWeight.w400,
                      // ),
                      // softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: AppColors.varidiantGreen,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
