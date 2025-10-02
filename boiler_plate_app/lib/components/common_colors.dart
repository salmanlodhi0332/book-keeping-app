import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonColors {
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color primaryColor = Color.fromARGB(255, 26, 146, 244);
  static const Color secoundryColor = Color(0xFFE9ECEF);

  static const Gradient GradientBlue = LinearGradient(
    colors: [Color(0xff3ca4dc), Color(0xff334ea0)],
    stops: [0, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient GradientBlueFromSide = LinearGradient(
    colors: [Color(0xff3ca4dc), Color(0xff334ea0)],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient GradientRed = LinearGradient(
    colors: [Color(0xffe52d27), Color(0xffb31217)],
    stops: [0, 1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient Gradientwhite = LinearGradient(
    colors: [
      Color.fromARGB(255, 230, 232, 235),
      Color.fromARGB(255, 225, 237, 248),
      Color.fromARGB(255, 235, 244, 250)
    ],
    stops: [0, 0.45, 0.75],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static SystemUiOverlayStyle get systemUiOverlayforwhite =>
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xffffffff),
        systemNavigationBarColor: Color(0xffffffff),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  static SystemUiOverlayStyle get systemUiOverlayforblack =>
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      );
  static SystemUiOverlayStyle get systemUiOverlayfortransparent =>
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      );
  static SystemUiOverlayStyle get systemUiOverlayforsplash =>
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff3ca4dc),
        systemNavigationBarColor: Color(0xff334ea0),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
}
