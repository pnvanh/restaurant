import 'package:equatable/equatable.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';

class HistoryState extends Equatable {
  @override
  List<Object> get props => [];
  bool isLoading = false;
}

class HistoryInitial extends HistoryState {}

class HistoryListSuccess extends HistoryState {
  List<HistoryEntity>? histories;

  HistoryListSuccess({
    this.histories,
  });

  @override
  List<Object> get props => [
        histories ?? [],
      ];

  List<HistoryEntity> get listHistories {
    if (histories == null) {
      return [];
    }
    return histories!;
  }
}

class HistoryListLoading extends HistoryState {
  bool loading = false;
  HistoryListLoading(this.loading);

  @override
  bool isLoading = false;
}

class HistoryListFailure extends HistoryState {
  String message;
  HistoryListFailure(this.message);

  @override
  List<Object> get props => [message];
}
