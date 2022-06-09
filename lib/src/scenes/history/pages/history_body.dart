import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';
import 'package:restaurant/src/scenes/history/blocs/bloc.dart';
import 'package:restaurant/src/scenes/history/widgets/widget.dart';

class HistoryBody extends StatefulWidget {
  @override
  _HistoryBodyState createState() => _HistoryBodyState();
}

class _HistoryBodyState extends State<HistoryBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HistoryBloc>(context).add(HistoriesListRequested());
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                List<HistoryEntity>? histories;
                if (state is HistoryListSuccess) {
                  histories = state.histories;
                }

                if (histories?.length == 0) {
                  return HistoryEmpty();
                }

                return HistoryBooking(histories: histories);
              },
            ),
            BookingMoreButton()
          ],
        ),
      ),
    );
  }
}
