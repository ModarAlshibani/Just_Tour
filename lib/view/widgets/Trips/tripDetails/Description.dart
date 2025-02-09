import 'package:flutter/cupertino.dart';
import 'package:terez/core/constant/appColors.dart';

class DescriptionText extends StatelessWidget {
  final String? description;
  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description:",
              style: TextStyle(
                  color: AppColors.blackCurrant,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              description!,
              style:
                  const TextStyle(color: AppColors.blackCurrant, fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
