import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/scenes/detail/blocs/bloc.dart';
import 'package:restaurant/src/scenes/detail/widgets/booking_button.dart';
import 'package:restaurant/src/scenes/detail/widgets/other_restaurant.dart';
import 'package:restaurant/src/scenes/detail/widgets/widget.dart';
import 'package:restaurant/src/scenes/home/widgets/widget.dart';

class DetailBody extends StatefulWidget {
  DetailBody({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final RestaurantEntity restaurant;
  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    final restaurant = widget.restaurant;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CardDetail(restaurant: restaurant),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    BlocBuilder<OtherRestaurantListBloc, DetailState>(
                      builder: (context, state) {
                        List<RestaurantEntity>? restaurants;
                        if (state is OtherRestaurantListSuccess) {
                          restaurants = state.restaurants;
                        }

                        if (restaurant == null) {
                          return Container();
                        }

                        return OtherRestaurant(
                          restaurants: restaurants ?? [],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
        BookingButton()
      ],
    );
  }
}
