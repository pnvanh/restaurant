import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/constants/app_text_style.dart';
import 'package:restaurant/src/data/models/banner_model.dart';

class TodayNewArivable extends StatelessWidget {
  const TodayNewArivable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Today New Arivable',
                    style: AppTextStyles.textSemiBold(16, AppColors.ebonyClay),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    'Best of the today  food list update',
                    style: AppTextStyles.textRegular(12, AppColors.grayChateau),
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.ebonyClay,
                    size: 14.0,
                  ),
                  label: Text(
                    'See All',
                    style: AppTextStyles.textRegular(12, AppColors.ebonyClay),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              height: 120,
              color: AppColors.heather,
            ),
          )
        ],
      ),
    );
  }
}
