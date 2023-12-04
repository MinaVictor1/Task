import 'package:flutter/widgets.dart';

Widget buildFullscreenImage() {
  return Image.asset(
    'assets/images/5.jpg',
    fit: BoxFit.cover,
    height: double.infinity,
    width: double.infinity,
    alignment: Alignment.center,
  );
}
