import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/models/tutorial.dart';
import 'package:garbage_control/presentation/core/routes.dart';

class TutorialItemWidget extends StatelessWidget {
  const TutorialItemWidget({Key? key, required this.tutorial})
      : super(key: key);

  final Tutorial? tutorial;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(
          videoPlayerPageRoute,
          arguments: tutorial,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              tutorial?.title?.toUpperCase() ?? '',
              style: const TextStyle(color: accentColor, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Image.network(getThumbnailUrl(tutorial?.youtubeId ?? '')),
          ],
        ),
      ),
    );
  }
}
