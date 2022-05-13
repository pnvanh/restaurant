import 'package:equatable/equatable.dart';

enum TabbarStatus { home, discover, notification, profile }

class TabbarState extends Equatable {
  final TabbarStatus status;

  TabbarState._({
    this.status = TabbarStatus.home,
  });

  TabbarState.discover()
      : this._(
          status: TabbarStatus.discover,
        );

  TabbarState.home()
      : this._(
          status: TabbarStatus.home,
        );

  TabbarState.notification()
      : this._(
          status: TabbarStatus.notification,
        );

  TabbarState.profile()
      : this._(
          status: TabbarStatus.profile,
        );

  @override
  List<dynamic> get props => [status];
}
