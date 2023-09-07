import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';

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
