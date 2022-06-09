import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class HistoryEmpty extends StatelessWidget {
  const HistoryEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset('assets/images/empty.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.0),
            child: Text(
              "Sorry, you haven't booking history",
              textAlign: TextAlign.center,
              style: AppTextStyles.textSemiBold(22, AppColors.booking),
            ),
          ),
        ],
      ),
    );
  }
}
