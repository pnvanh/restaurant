import 'package:flutter/material.dart';
import 'package:restaurant/src/scenes/home/widgets/widget.dart';

class RestaurantBooking extends StatelessWidget {
  const RestaurantBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          ProductContent(
            title: 'Booking Restaurant',
            description: 'Check your city Near by Restaurant',
          ),
          Container(
            height: 200,
            color: Colors.red,
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
