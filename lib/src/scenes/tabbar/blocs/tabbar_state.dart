import 'package:equatable/equatable.dart';

enum TabbarStatus { Home, Discover, Profile }

class TabbarState extends Equatable {
  final TabbarStatus status;

  const TabbarState._({
    this.status = TabbarStatus.Home,
  });

  const TabbarState.discover()
      : this._(
          status: TabbarStatus.Discover,
        );

  const TabbarState.home()
      : this._(
          status: TabbarStatus.Home,
        );

  const TabbarState.profile()
      : this._(
          status: TabbarStatus.Profile,
        );

  @override
  List<dynamic> get props => [status];
}
