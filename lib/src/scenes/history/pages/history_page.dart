import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/data/repositories/history_repository_implement.dart';
import 'package:restaurant/src/datasources/remote/history_remote_datasource.dart';
import 'package:restaurant/src/scenes/history/blocs/bloc.dart';
import 'history_body.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc(
        repository: HistoryRepositoryImplement(
          remoteDatasource: HistoryRemoteDatasourceImplement(),
          networkInfo: NetworkInfoImplement(),
        ),
      )..add(
          HistoriesListRequested(),
        ),
      child: HistoryBody(),
    );
  }
}
