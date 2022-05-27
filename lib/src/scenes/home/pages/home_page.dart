import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/data/repositories/home_repository_implement.dart';
import 'package:restaurant/src/datasources/remote/home_remote_datasource.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';
import 'package:restaurant/src/scenes/home/blocs/home_bloc.dart';
import 'home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBannerBloc(
            repository: HomeRepositoryImplement(
              remoteDatasource: HomeRemoteDatasourceImplement(),
              networkInfo: NetworkInfoImplement(),
            ),
          )..add(HomeBannerRequested()),
        ),
        BlocProvider(
          create: (context) => HomeNewBloc(
            repository: HomeRepositoryImplement(
                remoteDatasource: HomeRemoteDatasourceImplement(),
                networkInfo: NetworkInfoImplement()),
          )..add(HomeListNewFoodsRequested()),
        ),
        BlocProvider(
          create: (context) => HomeRestaurantListBloc(
            repository: HomeRepositoryImplement(
                remoteDatasource: HomeRemoteDatasourceImplement(),
                networkInfo: NetworkInfoImplement()),
          )..add(HomeListRestaurantsRequested()),
        ),
      ],
      child: HomeBody(),
    );
  }
}
