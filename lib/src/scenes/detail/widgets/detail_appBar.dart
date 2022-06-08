import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/constants/app_text_style.dart';

class DetailAppBar extends AppBar {
  DetailAppBar(
    @required BuildContext context,
  ) : super(
          centerTitle: true,
          backgroundColor: AppColors.jungleGreen,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
          title: Text(
            "Detail Restaurant",
            style: AppTextStyles.textSemiBold(12, Colors.white),
          ),
        );
}
