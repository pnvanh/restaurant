import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class SearchTextField extends StatelessWidget {
  final Function textChanged;

  const SearchTextField({
    Key? key,
    required this.textChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16.0),
      child: Container(
        height: 36.0,
        decoration: BoxDecoration(
          color: AppColors.grayGravity,
          border: Border.all(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(11.0),
        ),
        margin: EdgeInsets.all(12),
        child: Row(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 27),
              child: Icon(
                Icons.search,
                color: Colors.grey,
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
            )
          ],
        ),
      ),
    );
  }
}
