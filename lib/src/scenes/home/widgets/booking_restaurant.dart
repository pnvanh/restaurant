import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';
import 'package:restaurant/src/scenes/home/widgets/widget.dart';

class RestaurantBooking extends StatelessWidget {
  const RestaurantBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: BlocBuilder<HomeRestaurantListBloc, HomeState>(
          builder: (context, state) {
        List<RestaurantEntity>? restaurants;
        if (state is HomeNewListSuccess) {
          restaurants = state.restaurants;
        }

        if (restaurants == null) {
          return Container();
        }

        return Column(
          children: <Widget>[
            ProductContent(
              title: 'Today New Arivable',
              description: 'Best of the today  food list update',
            ),
            RestaurantsList(
              restaurants: restaurants,
            ),
          ],
        );
      }),
    );
  }
}
