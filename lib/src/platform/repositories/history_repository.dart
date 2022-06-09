import 'package:dartz/dartz.dart';
import 'package:restaurant/src/core/errror/failure.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<HistoryEntity>>> fetchHistories();
}
