import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/models/tutorial.dart';
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

List<Widget> bottomAppBarItems({
  required BuildContext context,
  required bool isAdmin,
}) =>
    <Widget>[
      CustomBottomAppBarItem(
        iconData: Icons.home_outlined,
        title: 'Home',
        onPressed: (String p0) {
          isAdmin
              ? Navigator.of(context).pushNamed(adminHomePageRoute)
              : Navigator.of(context).pushNamed(homePageRoute);
        },
      ),
      if (!isAdmin)
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
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

void changeUserPassword({
  required String password,
  required BuildContext context,
}) async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? currentUser = firebaseAuth.currentUser;
  currentUser?.updatePassword(password).then(
    (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully')),
      );
      Navigator.of(context).pop();
    },
  ).catchError((err) {
    // An error has occurred.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('An error occurred please log out and log back in'),
      ),
    );
  });
}

String getThumbnailUrl(String videoUrl) {
  return 'https://img.youtube.com/vi/$videoUrl/0.jpg';
}

List<Tutorial> litterTutorials = <Tutorial>[
  Tutorial(id: 1, title: 'Reusing at home', youtubeId: '5xrWrKIVBgo'),
  Tutorial(id: 2, title: 'Benefits of recycling', youtubeId: '8fnB0Bm4wys'),
  Tutorial(id: 3, title: 'Recycling for kids', youtubeId: '6jQ7y_qQYUA'),
  Tutorial(id: 4, title: 'What is waste management', youtubeId: 'K6ppCC3lboU'),
  Tutorial(id: 5, title: 'Proper waste management', youtubeId: 'Qyu-fZ8BOnI'),
];
