import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
    required this.marker,
    required this.restaurant,
  }) : super(key: key);

  final Marker marker;
  final BusinessEntity? restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox.fromSize(
                size: Size.fromRadius(48),
                child: restaurant?.imageUrl != null
                    ? Image.network(restaurant?.imageUrl ?? "",
                        fit: BoxFit.cover)
                    : Image.asset('assets/images/placeholder-image.png'),
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${restaurant?.name}",
                  style: AppTextStyles.textSemiBold(22, AppColors.ebonyClay),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_location.svg',
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                    Flexible(
                      child: Text(
                        "${restaurant?.location?.address}, "
                        "${restaurant?.location?.city}, "
                        "${restaurant?.location?.country}",
                        // maxLines: 2,
                        style:
                            AppTextStyles.textRegular(14, AppColors.ebonyClay),
                      ),
                    ),
                  ],
                ),
                Row(children: <Widget>[
                  Icon(
                    Icons.phone_rounded,
                    color: AppColors.jungleGreen,
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    restaurant?.phoneDisplay ?? "",
                    style: AppTextStyles.textRegular(15, AppColors.ebonyClay),
                  ),
                ]),
                Spacer(),
                SizedBox(
                  height: 36,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Book now',
                      style: AppTextStyles.textSemiBold(14, Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
