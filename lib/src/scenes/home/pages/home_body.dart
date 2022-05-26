import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/data/models/banner_model.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';
import 'package:restaurant/src/scenes/home/widgets/today_new_arivable.dart';
import 'package:restaurant/src/scenes/splash/widgets/widgets.dart';
import 'package:restaurant/src/scenes/widgets/widgets.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SearchTextField(textChanged: (text) => {print(text)}),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              List<BannerModel>? banners;
              if (state is HomeNewListSuccess) {
                banners = state.banners;
              }

              if (banners == null) {
                return Container();
              }

              return Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: banners.length,
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Hero(
                            tag: index,
                            child: FadeInImage.assetNetwork(
                              image: banners?[index].imageUrl ?? "",
                              fit: BoxFit.cover,
                              placeholder:
                                  "assets/images/placeholder-image.png",
                              placeholderScale:
                                  MediaQuery.of(context).size.width / 2,
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: 150.0,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        viewportFraction: 0.78,
                        scrollPhysics: BouncingScrollPhysics(),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        banners.length,
                        (index) =>
                            DotIndicator(index: index, currentPage: _current),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 36),
                    child: TodayNewArivable(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
