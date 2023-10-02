import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/application/redux/view_models/bottom_app_state_view_model.dart';

import '../../../application/redux/states/app_state.dart';

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({Key? key, required this.isAdmin}) : super(key: key);

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: StoreConnector<AppState, BottomAppStateViewModel>(
        converter: (Store<AppState> store) =>
            BottomAppStateViewModel.fromStore(store),
        builder: (BuildContext context, BottomAppStateViewModel vm) {
          final List<Widget> items = bottomAppBarItems(
            context: context,
            isAdmin: isAdmin,
          );
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[...items],
            ),
          );
        },
      ),
    );
  }
}
