import 'package:flutter/material.dart';
import 'package:restaurant/src/scenes/booking/pages/booking_date_body.dart';

import '../../detail/widgets/detail_appBar.dart';

class BookingDatePage extends StatefulWidget {
  BookingDatePage({Key? key}) : super(key: key);

  @override
  State<BookingDatePage> createState() => _BookingDatePageState();
}

class _BookingDatePageState extends State<BookingDatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(context),
      body: BookingDateBody(),
    );
  }
}
