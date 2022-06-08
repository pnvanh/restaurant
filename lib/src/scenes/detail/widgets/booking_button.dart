import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({
    Key? key,
  }) : super(key: key);

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
                onPressed: () {},
                child: Text(
                  'Booking',
                  style: AppTextStyles.textSemiBold(14, Colors.white),
                ),
              ),
            ),
          )),
    );
  }
}
