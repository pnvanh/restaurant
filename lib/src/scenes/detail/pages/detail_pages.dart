import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/core/network/network_info.dart';
import 'package:restaurant/src/data/repositories/home_repository_implement.dart';
import 'package:restaurant/src/datasources/remote/home_remote_datasource.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/scenes/detail/blocs/bloc.dart';
import 'package:restaurant/src/scenes/detail/pages/pages.dart';
import 'package:restaurant/src/scenes/detail/widgets/widget.dart';

class DetailPage extends StatefulWidget {
  // final RestaurantEntity restaurant;

  // const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final restaurant = arguments['restaurant'] as RestaurantEntity;
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: DetailAppBar(context),
      body: BlocProvider<OtherRestaurantListBloc>(
        create: (context) => OtherRestaurantListBloc(
          repository: HomeRepositoryImplement(
            networkInfo: NetworkInfoImplement(),
            remoteDatasource: HomeRemoteDatasourceImplement(),
          ),
        )..add(OtherRestaurantsListRequested()),
        child: DetailBody(restaurant: restaurant),
      ),
    );
  }
}
