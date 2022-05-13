import 'package:equatable/equatable.dart';

abstract class TabbarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TabbarHomeSelected extends TabbarEvent {}

class TabbarDiscoverSelected extends TabbarEvent {}

class TabbarNotificationSelected extends TabbarEvent {}

class TabbarProfileSelected extends TabbarEvent {}
