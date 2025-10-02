import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// import '../custom/fullscreen_Imageview.dart';

class Navigation {
  static Navigation? _instance;
  static Navigation get getInstance => _instance ??= Navigation();


  screenNavigation(BuildContext context, Widget childwidget) {
    return Navigator.push(
        context,
        Platform.isAndroid
            ? MaterialPageRoute(builder: (context) => childwidget)
            : CupertinoPageRoute(builder: (context) => childwidget));
  }

  void RightToLeft_PageNavigation(BuildContext context, Widget childWidget) {
    if (Platform.isAndroid) {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: childWidget,
          isIos: false,
          duration: Duration(milliseconds: 200),
          reverseDuration: Duration(milliseconds: 200),
        ),
      );
    } else if (Platform.isIOS) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => childWidget,
        ),
      );
    }
  }

  void pagePushAndReplaceNavigation(BuildContext context, Widget childWidget) {
    if (Platform.isIOS) {
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => childWidget,
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: childWidget,
          isIos: false,
          duration: Duration(milliseconds: 900),
          reverseDuration: Duration(milliseconds: 200),
        ),
        (route) => false,
      );
    }
  }

}
