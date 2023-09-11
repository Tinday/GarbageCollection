import 'package:async_redux/async_redux.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';

class BottomAppStateViewModel extends Vm {
  BottomAppStateViewModel({
    this.selectedIndex,
  }) : super(equals: <Object?>[selectedIndex]);

  factory BottomAppStateViewModel.fromStore(Store<AppState> store) {
    return BottomAppStateViewModel(
      selectedIndex: store.state.bottomNavigationState?.selectedIndex,
    );
  }

  final int? selectedIndex;
}
