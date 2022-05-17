import 'package:flutter/material.dart';

class DiscoverBody extends StatefulWidget {
  @override
  _DiscoverBodyState createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: Text("Discover")),
    );
  }
}
