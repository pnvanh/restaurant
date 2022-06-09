import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';
import 'package:restaurant/src/platform/repositories/history_repository.dart';
import 'package:restaurant/src/scenes/history/blocs/bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required HistoryRepository repository})
      : this.repository = repository,
        super(HistoryInitial());

  final HistoryRepository repository;

  @override
  Stream<HistoryState> mapEventToState(HistoryEvent event) async* {
    if (event is HistoriesListRequested) {
      yield* mapHistoriesListRequestedToSate(event);
    }
  }

  Stream<HistoryState> mapHistoriesListRequestedToSate(
      HistoriesListRequested event) async* {
    try {
      final results = await repository.fetchHistories();

      if (results.isRight()) {
        final List<HistoryEntity>? histories = results.getOrElse(() => []);
        yield HistoryListSuccess(histories: histories);
      }
    } on HistoryListFailure catch (error) {
      yield HistoryListFailure('message: $error');
    }
  }
}
