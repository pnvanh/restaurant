import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/restaurant_entity.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  final List<RestaurantEntity> restaurants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 6.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 64,
                      padding: EdgeInsets.only(right: 16.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: Hero(
                            tag: index,
                            child: FadeInImage.assetNetwork(
                              image: restaurants[index].imageUrl ?? "",
                              fit: BoxFit.cover,
                              placeholder:
                                  "assets/images/placeholder-image.png",
                              placeholderScale:
                                  MediaQuery.of(context).size.width / 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            restaurants[index].name ?? "",
                            style: AppTextStyles.textSemiBold(
                              16,
                              AppColors.ebonyClay,
                            ),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Row(
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/ic_location.svg'),
                              SizedBox(
                                width: 2.0,
                              ),
                              Expanded(
                                child: Text(
                                  restaurants[index].location ?? "",
                                  style: AppTextStyles.textRegular(
                                      10, AppColors.ebonyClay),
                                ),
                              ),
                              SizedBox(
                                height: 28.0,
                                width: 88.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.jungleGreen,
                                    onPrimary: Colors.white,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Book',
                                    style: AppTextStyles.textSemiBold(
                                        12, Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
