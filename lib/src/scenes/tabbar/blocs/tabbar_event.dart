import 'package:equatable/equatable.dart';

abstract class TabbarEvent extends Equatable {
  @override
  List<dynamic> get props => [];
}

class TabbarHomeSelected extends TabbarEvent {}

class TabbarDiscoverSelected extends TabbarEvent {}

class TabbarProfileSelected extends TabbarEvent {}
