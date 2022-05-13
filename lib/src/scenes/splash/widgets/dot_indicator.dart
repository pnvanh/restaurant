import 'package:flutter/cupertino.dart';
import 'package:restaurant/src/constants/constants.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.index,
    required this.currentPage,
  }) : super(key: key);
  final int index, currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 8.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.jungleGreen : AppColors.mercury,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
