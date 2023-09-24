import 'package:flutter/material.dart';
import 'package:garbage_control/constants/theme.dart';

class UserProfileItem extends StatelessWidget {
  const UserProfileItem({
    Key? key,
    required this.title,
    required this.route,
    this.hasPadding = true,
    this.arguments,
  }) : super(key: key);

  final String title;
  final String route;
  final bool hasPadding;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(route, arguments: arguments);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: hasPadding
            ? const EdgeInsets.symmetric(horizontal: 24)
            : EdgeInsets.zero,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: profileDividerGreyColor,
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
