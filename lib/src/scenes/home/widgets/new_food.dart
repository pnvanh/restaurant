import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';

class NewFood extends StatelessWidget {
  const NewFood({Key? key, required this.foods}) : super(key: key);
  final List<FoodEntity> foods;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Container(
              width: 148.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 103.0,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Hero(
                          tag: index,
                          child: FadeInImage.assetNetwork(
                            image: foods[index].imageUrl ?? "",
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder-image.png",
                            placeholderScale:
                                MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            foods[index].name ?? "",
                            style: AppTextStyles.textSemiBold(
                                16, AppColors.ebonyClay),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SvgPicture.asset('assets/icons/ic_location.svg'),
                              Flexible(
                                child: Text(
                                  foods[index].location ?? "",
                                  maxLines: 2,
                                  style: AppTextStyles.textRegular(
                                      12, AppColors.ebonyClay),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
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
