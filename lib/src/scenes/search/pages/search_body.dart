import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/scenes/search/widgets/widgets.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  LatLng? currentLatLng;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(17.42796133580664, 122.085749655962),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {
        print("Lat: ${currLocation.latitude} Lon ${currLocation.longitude}");
        currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroudColor,
      appBar: SearchppBar(context),
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: currentLatLng ?? LatLng(37.785834, -122.406417),
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) async {
          String style = await DefaultAssetBundle.of(context)
              .loadString('assets/draft/map_style.json');
          controller.setMapStyle(style);
          _controller.complete(controller);
        },
      ),
    );
  }
}
