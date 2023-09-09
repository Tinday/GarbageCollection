import 'package:flutter/material.dart';
import 'package:garbage_control/constants/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.trailingWidget = const SizedBox(),
    this.bottom,
    this.leadingWidget,
  }) : super(key: key);

  final String title;
  final Widget trailingWidget;
  final TabBar? bottom;
  final Widget? leadingWidget;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      leading: leadingWidget ??
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, color: whiteColor),
          ),
      title: Text(title),
      actions: <Widget>[trailingWidget],
      bottom: bottom,
      centerTitle: true,
    );
  }
}
