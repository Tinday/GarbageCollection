import 'package:flutter/material.dart';
import 'package:garbage_control/constants/theme.dart';

class SecondaryCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SecondaryCustomAppBar({
    Key? key,
    required this.title,
    this.trailingWidget = const SizedBox(),
  }) : super(key: key);

  final String title;
  final Widget trailingWidget;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
        ),
        title: Text(
          title,
          style: const TextStyle(color: primaryColor),
        ),
        actions: <Widget>[trailingWidget],
      ),
    );
  }
}
