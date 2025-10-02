import 'dart:io';

import 'package:boiler_plate_app/components/common_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';


class SmallLoader extends StatelessWidget {
  const SmallLoader({
    Key? key,
    this.adaptive = false,
    this.color,
  }) : super(key: key);
  final bool adaptive;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return adaptive
        ? Platform.isIOS
            ? CupertinoActivityIndicator(
                color: color ?? CommonColors.primaryColor,
              )
            : SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? CommonColors.primaryColor,
                  ),
                ),
              )
        : Center(
            child: SpinKitThreeInOut(
              color: CommonColors.primaryColor,
              size: 20,
            ),
          );
  }
}


class SmallLoading extends StatelessWidget {
  const SmallLoading({
    Key? key,
    this.adaptive = false,
    this.color,
  }) : super(key: key);
  final bool adaptive;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return adaptive
        ? Platform.isIOS
            ? CupertinoActivityIndicator(
                color: color ?? Colors.white,
              )
            : SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? Colors.white,
                  ),
                ),
              )
        : Center(
            child: SpinKitRotatingPlain(
              color: Colors.white,
              size: 20,
            ),
          );
  }
}
	