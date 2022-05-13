import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  TabbarBloc(TabbarState initialState) : super(initialState);

  @override
  Stream<TabbarState> mapEventToState(TabbarEvent event) async* {
    if (event is TabbarHomeSelected) {
      yield TabbarState.home();
    }

    if (event is TabbarDiscoverSelected) {
      yield TabbarState.discover();
    }

    if (event is TabbarNotificationSelected) {
      yield TabbarState.notification();
    }

    if (event is TabbarProfileSelected) {
      yield TabbarState.profile();
    }
  }
}
