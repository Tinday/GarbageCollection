import 'package:flutter/material.dart';

class CustomBottomAppBarItem extends StatelessWidget {
  const CustomBottomAppBarItem({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onPressed(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Icon(iconData), Text(title)],
        ),
      ),
    );
  }
}
