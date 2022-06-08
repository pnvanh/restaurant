import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final RestaurantEntity restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 15),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "${restaurant.name}",
                    style: AppTextStyles.textSemiBold(20, AppColors.ebonyClay),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icons/ic_location.svg',
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Flexible(
                      child: Text(
                        "${restaurant.location}",
                        maxLines: 2,
                        style: AppTextStyles.textRegular(
                          12,
                          AppColors.ebonyClay,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Hero(
                  tag: restaurant.id.toString(),
                  child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: FadeInImage.assetNetwork(
                        image: restaurant.imageUrl ?? "",
                        fit: BoxFit.cover,
                        placeholder: "assets/images/placeholder-image.png",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/ic_clock.svg',
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Open today",
                                style: AppTextStyles.textSemiBold(
                                    12, AppColors.ebonyClay),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "10:00 AM - 12:00 PM",
                            style: AppTextStyles.textSemiBold(
                                12, AppColors.ebonyClay),
                          ),
                        ],
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.directions),
                        label: Text(
                          "Visit the Restaurant",
                          style: AppTextStyles.textSemiBold(12, AppColors.blue),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
