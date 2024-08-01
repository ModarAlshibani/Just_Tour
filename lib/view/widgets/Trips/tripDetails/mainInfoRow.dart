import 'package:flutter/material.dart';
import 'package:terez/core/constant/appColors.dart';

class MainInfoRow extends StatelessWidget {
  final String teamName;
  final String type;
  final String level;
  final DateTime startDate;
  final DateTime endDate;
  const MainInfoRow(
      {super.key,
      required this.teamName,
      required this.type,
      required this.level,
      required this.startDate,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Icon(
                  Icons.people_outline,
                  color: Colors.black54,
                  size: 23,
                ),
                Container(
                  width: 65,
                  height: 20,
                  child: Text(
                    teamName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            Column(
              children: [
                const Icon(
                  Icons.assistant_photo_outlined,
                  color: Colors.black54,
                  size: 23,
                ),
                Text(
                  type,
                  style: const TextStyle(color: Colors.black54),
                )
              ],
            ),
            const SizedBox(
              width: 78,
            ),
            Column(
              children: [
                const Icon(
                  Icons.auto_graph_outlined,
                  color: Colors.black54,
                  size: 23,
                ),
                Text(
                  level.substring(6),
                  style: const TextStyle(color: Colors.black54),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 165,
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Start date:",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "   ${startDate.day} / ${startDate.month} / ${startDate.year}",
                    style: const TextStyle(color: Colors.black54, fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 165,
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "End date:",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "   ${endDate.day} / ${endDate.month} / ${endDate.year}",
                    style: const TextStyle(color: Colors.black54, fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}
