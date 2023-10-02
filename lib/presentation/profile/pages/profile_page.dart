import 'package:async_redux/async_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/user_state_view_model.dart';
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
      body: StoreConnector<AppState, UserStateViewModel>(
        converter: (Store<AppState> store) =>
            UserStateViewModel.fromStore(store),
        builder: (BuildContext context, UserStateViewModel vm) {
          final String userName = vm.user?.fullName ?? '';
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 170,
                child: Image.asset(avatarImage),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  userName,
                  style: const TextStyle(fontSize: 24, color: primaryColor),
                ),
              ),
              const SizedBox(height: 20),
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
          );
        },
      ),
      bottomNavigationBar: const CustomBottomAppbar(
        isAdmin: true,
      ),
    );
  }
}
