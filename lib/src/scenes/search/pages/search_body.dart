import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/constants/app_text_style.dart';
import 'package:restaurant/src/extentions/format_image.dart';
import 'package:restaurant/src/platform/entities/business_entity.dart';
import 'package:restaurant/src/scenes/search/widgets/restaurant_info.dart';
import '../blocs/bloc.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List<Marker> markerList = [];
  List<BusinessEntity> restaurants = [];

  LatLng? currentLatLng;
  LatLng? newLatLng;

  bool isShowResraurant = false;
  bool isShowSearchArea = false;

  late Uint8List markerIcon;

  Completer<GoogleMapController> _controller = Completer();
  final PageController _pageController = PageController();

  void setCustomMarker() async {
    markerIcon = (await getBytesFromAsset('assets/images/marker.png', 64));
  }

  void getCurrantLocaiton() async {
    Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  @override
  void initState() {
    getCurrantLocaiton();
    setCustomMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listener: (context, state) {
        if (state.restaurants != null) {
          setState(() {
            restaurants = state.restaurants ?? [];
            state.restaurants?.forEach((element) {
              var index = restaurants.indexOf(element);
              markerList.add(
                Marker(
                  markerId: MarkerId(element.id),
                  position: LatLng(element.coordinates?.latitude ?? 0,
                      element.coordinates?.longitude ?? 0),
                  icon: BitmapDescriptor.fromBytes(markerIcon),
                  onTap: () {
                    _pageController.animateToPage(index,
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeIn);
                  },
                ),
              );
            });
          });
        }
      },
      child: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (_, __) => false,
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: currentLatLng!,
                    zoom: 14,
                  ),
                  markers: Set<Marker>.of(markerList),
                  onMapCreated: (GoogleMapController controller) async {
                    state.location = currentLatLng;
                    BlocProvider.of<SearchBloc>(context).add(
                      LocationLoaded(
                        currentLatLng ?? LatLng(0, 0),
                      ),
                    );

                    String style = await DefaultAssetBundle.of(context)
                        .loadString('assets/draft/map_style.json');
                    controller.animateCamera(CameraUpdate.newLatLngZoom(
                        LatLng(currentLatLng?.latitude ?? 0,
                            currentLatLng?.longitude ?? 0),
                        14));
                    isShowSearchArea = false;
                    controller.setMapStyle(style);
                    _controller.complete(controller);
                  },
                  onCameraMove: (cameraPosition) {
                    double distanceInMeters = Geolocator.distanceBetween(
                        cameraPosition.target.latitude,
                        cameraPosition.target.longitude,
                        currentLatLng?.latitude ?? 0,
                        currentLatLng?.longitude ?? 0);

                    setState(() {
                      distanceInMeters > 2500
                          ? isShowSearchArea = true
                          : isShowSearchArea = false;

                      newLatLng = LatLng(cameraPosition.target.latitude,
                          cameraPosition.target.longitude);
                    });
                  }),
              Positioned(
                bottom: (MediaQuery.of(context).size.height * 0.26) + 40,
                left: 56,
                right: 56,
                child: Visibility(
                  visible: isShowSearchArea,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          BlocProvider.of<SearchBloc>(context).add(
                            LocationLoaded(
                              newLatLng ?? LatLng(0, 0),
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Search this area',
                        style: AppTextStyles.textRegular(
                            14, AppColors.jungleGreen),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 50.0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.26,
                  child: PageView.builder(
                    itemCount: markerList.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      final marker = markerList[index];
                      final restaurant = restaurants[index];
                      return RestaurantInfo(
                        marker: marker,
                        restaurant: restaurant,
                      );
                    },
                  )),
            ],
          );
        },
      ),
    );
  }
}
