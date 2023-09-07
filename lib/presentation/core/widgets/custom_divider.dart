import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(child: Container(height: 1.5, color: dividerGreyColor)),
          const Padding(padding: EdgeInsets.all(14), child: Text(or)),
          Expanded(child: Container(height: 1.5, color: dividerGreyColor)),
        ],
      ),
    );
  }
}
