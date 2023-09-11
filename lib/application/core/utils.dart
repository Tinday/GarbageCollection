import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar_item.dart';

final GlobalKey<NavigatorState> appGlobalNavigatorKey =
    GlobalKey<NavigatorState>();
// show loading indicator
void displayLoadingDialog({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Dialog(
        child: SizedBox(
          height: 160,
          width: 160,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                    strokeWidth: 2, backgroundColor: Colors.grey),
                SizedBox(height: 10),
                Text(loading),
              ],
            ),
          ),
        ),
      );
    },
  );
}

List<Widget> bottomAppBarItems({required BuildContext context}) => <Widget>[
      CustomBottomAppBarItem(
        iconData: Icons.home_outlined,
        title: 'Home',
        onPressed: (String p0) {
          Navigator.of(context).pushNamed(homePageRoute);
        },
      ),
      CustomBottomAppBarItem(
        iconData: Icons.tune,
        title: 'Discover',
        onPressed: (String p0) {
          Navigator.of(context).pushNamed(discoverRoute);
        },
      ),
      CustomBottomAppBarItem(
        iconData: Icons.person,
        title: 'Profile',
        onPressed: (String p0) {
          Navigator.of(context).pushNamed(profilePageRoute);
        },
      ),
    ];

String getGreetingMessage() {
  final int hour = DateTime.now().hour;
  // final String name = firstName == null ? '' : ', $firstName';
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
