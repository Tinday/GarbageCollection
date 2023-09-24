import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/constants/assets_strings.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';
import 'package:garbage_control/presentation/profile/widgets/user_profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: Image.asset(avatarImage),
          ),
          const Center(
              child: Text(
            'Manage your profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(height: 30),
          const UserProfileItem(
            title: 'Change user name',
            route: changeUserNameRoute,
          ),
          const UserProfileItem(
            title: 'Change email',
            route: changeEmailRoute,
          ),
          const UserProfileItem(
            title: 'Change password',
            route: changePasswordRoute,
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            width: double.infinity,
            height: 48,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: redColor, width: 1.5),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamed(welcomePageRoute);
              },
              child: const Text(logOut, style: TextStyle(color: redColor)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
