import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure(this.message);
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {
  static String get message => 'Network not available!';
}
