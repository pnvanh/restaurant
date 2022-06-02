import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/data/repositories/business_repository_implement.dart';
import 'package:restaurant/src/datasources/remote/business_remote_datasource.dart';
import 'package:restaurant/src/platform/usecase/business_usecase.dart';
import 'package:restaurant/src/scenes/search/blocs/bloc.dart';
import 'package:restaurant/src/scenes/search/pages/pages.dart';
import 'package:restaurant/src/scenes/search/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroudColor,
      appBar: SearchppBar(context),
      body: BlocProvider<SearchBloc>(
        create: (context) => SearchBloc(
          businessUsecase: BusinessUsecase(
            repository: BusinessRepositoryImplement(
              networkInfo: NetworkInfoImplement(),
              remoteDatasource: BusinessRemoteDatasourceImplement(),
            ),
          ),
        ),
        child: SearchBody(),
      ),
    );
  }
}
