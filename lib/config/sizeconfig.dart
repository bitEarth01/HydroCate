import 'package:flutter/material.dart';
import 'dart:math';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    final double diagonalSize = sqrt(pow(screenW!, 2) + pow(screenH!, 2));
    blockH = diagonalSize / 100;
    blockV = diagonalSize / 100;
  }
}
