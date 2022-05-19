import 'package:equatable/equatable.dart';

enum TabbarStatus { home, discover, profile }

class TabbarState extends Equatable {
  final TabbarStatus status;

  const TabbarState._({
    this.status = TabbarStatus.home,
  });

  const TabbarState.discover()
      : this._(
          status: TabbarStatus.discover,
        );

  const TabbarState.home()
      : this._(
          status: TabbarStatus.home,
        );

  const TabbarState.profile()
      : this._(
          status: TabbarStatus.profile,
        );

  @override
  List<dynamic> get props => [status];
}
