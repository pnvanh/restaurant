import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: AppTextStyles.textSemiBold(16, AppColors.ebonyClay),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                description,
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
    );
  }
}
