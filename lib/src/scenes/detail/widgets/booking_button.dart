import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';
import 'package:restaurant/src/routers/routers.dart';
import 'package:restaurant/src/scenes/widgets/widgets.dart';

class BookingButton extends StatelessWidget {
  BookingButton({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantEntity restaurant;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 85.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 232.0,
            height: 43.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.jungleGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, bookingRouter);
                // showCustomDialog(context, restaurant);
              },
              child: Text(
                'Booking',
                style: AppTextStyles.textSemiBold(14, Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
