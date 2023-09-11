// Flutter imports:
import 'package:garbage_control/presentation/core/widgets/spaces.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePageCard extends StatelessWidget {
  ///

  final String iconUrl;
  final String title;
  final int count;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const HomePageCard({
    Key? key,
    this.count = 0,
    required this.iconUrl,
    required this.title,
    this.onTap,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width / 2) - 60;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        iconUrl,
                        fit: BoxFit.fitWidth,
                        height: width,
                        width: width,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                  ],
                ),
              ),
            ),
          ),
          if (count > 0)
            Positioned(
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                constraints: const BoxConstraints(
                  minWidth: 28,
                  minHeight: 28,
                ),
                child: Align(
                  child: Text(
                    '$count',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
