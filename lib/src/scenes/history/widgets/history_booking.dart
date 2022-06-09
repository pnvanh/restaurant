import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/platform/entities/history_entity.dart';

class HistoryBooking extends StatelessWidget {
  const HistoryBooking({
    Key? key,
    required this.histories,
  }) : super(key: key);

  final List<HistoryEntity>? histories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: histories?.length ?? 0,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              height: 88.0,
              child: Card(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: FadeInImage.assetNetwork(
                            image: histories?[index].imageUrl ?? "",
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder-image.png",
                            placeholderScale:
                                MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 12.0, bottom: 12.0, right: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${histories?[index].name}",
                              style: AppTextStyles.textSemiBold(
                                  18, AppColors.ebonyClay),
                            ),
                            Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/icons/ic_location.svg',
                                  width: 16,
                                  height: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    "${histories?[index].location} 1231231232",
                                    style: AppTextStyles.textRegular(
                                      12,
                                      AppColors.ebonyClay,
                                    ),
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
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Check',
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
