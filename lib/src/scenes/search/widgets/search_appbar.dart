import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/app_colors.dart';

class SearchAppBar extends AppBar {
  SearchAppBar(
    @required BuildContext context,
  ) : super(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.bluewood,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Container(
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(left: 27),
                child: Icon(
                  Icons.search,
                  color: AppColors.grayChateau,
                  size: 20,
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    isDense: true,
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/avatar.png'),
              iconSize: 50,
              onPressed: () {},
            )
          ],
        );
}
