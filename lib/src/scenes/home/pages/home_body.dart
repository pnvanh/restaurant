import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';
import 'package:restaurant/src/scenes/home/widgets/home_banner.dart';
import 'package:restaurant/src/scenes/home/widgets/today_new_arivable.dart';
import 'package:restaurant/src/scenes/home/widgets/widget.dart';
import 'package:restaurant/src/scenes/widgets/widgets.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SearchTextField(textChanged: (text) => {print(text)}),
          BlocBuilder<HomeBannerBloc, HomeState>(
            builder: (context, state) {
              List<BannerEntity>? banners;
              if (state is HomeNewListSuccess) {
                banners = state.banners;
              }

              if (banners == null) {
                return Container();
              }

              return HomeBanner(
                banners: banners,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 36),
            child: TodayNewArivable(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 36),
            child: RestaurantBooking(),
          ),
        ],
      ),
    );
  }
}
