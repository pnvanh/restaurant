import 'package:flutter/material.dart';
import 'package:restaurant/src/constants/constants.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Container(
              width: 48,
              height: 6,
              decoration: BoxDecoration(
                color: AppColors.iron,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        "Create Account",
                        style: AppTextStyles.textSemiBold(
                            16, AppColors.jungleGreen),
                      ),
                    ),
                    Container(
                      width: 77,
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColors.jungleGreen,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        "Login",
                        style:
                            AppTextStyles.textSemiBold(16, AppColors.manatee),
                      ),
                    ),
                    Container(
                      width: 77,
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColors.jungleGreen.withOpacity(0),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(child: BottomSheetBody())
        ],
      ),
    );
  }
}

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 26.0, top: 36.0, right: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Full Name',
                style: AppTextStyles.textSemiBold(14, AppColors.oxfordBlue),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                height: 48.0,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    hintStyle: AppTextStyles.textRegular(12, AppColors.heather),
                    hintText: "Enter your full name",
                  ),
                ),
              )
            ],
          ),
        ),
        Center(
          child: Text('Second Page'),
        ),
      ],
    );
  }
}
