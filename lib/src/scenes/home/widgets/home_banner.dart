import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/src/platform/entities/banner_entity.dart';
import 'package:restaurant/src/scenes/splash/widgets/dot_indicator.dart';

class HomeBanner extends StatefulWidget {
  HomeBanner({Key? key, required this.banners}) : super(key: key);

  final List<BannerEntity> banners;

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.banners.length,
          itemBuilder: (context, index, realIdx) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Hero(
                  tag: index,
                  child: FadeInImage.assetNetwork(
                    image: widget.banners[index].imageUrl ?? "",
                    fit: BoxFit.cover,
                    placeholder: "assets/images/placeholder-image.png",
                    placeholderScale: MediaQuery.of(context).size.width / 2,
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
              widget.banners.length,
              (index) => DotIndicator(index: index, currentPage: _current),
            ),
          ),
        ),
      ],
    );
  }
}
