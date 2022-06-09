import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/src/constants/constants.dart';

class BookingMoreButton extends StatelessWidget {
  const BookingMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182.0,
      height: 43.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: OutlinedButton(
        onPressed: () => {},
        style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1, color: Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SvgPicture.asset('assets/icons/ic_plus.svg'),
            Text(
              'Booking more',
              style: AppTextStyles.textRegular(15, AppColors.booking),
            ),
          ],
        ),
      ),
    );
  }
}
