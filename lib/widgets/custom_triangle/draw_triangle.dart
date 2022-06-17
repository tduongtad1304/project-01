// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math_64.dart' as math hide Colors;

class DrawTriangle extends CustomPainter {
  //Length of triangle's side a
  final double a;

  //Length of triangle's side b
  final double b;

  //Angle between side a and side b
  final double angle;

  //Triangle's inner color
  final Color color;

  //Triangle's side width
  final double sideWidth;

  //Triangle's side color
  final Color sideColor;

  DrawTriangle(
      {required this.angle,
      required this.a,
      required this.b,
      required this.color,
      required this.sideWidth,
      required this.sideColor});

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    //Move to scaffold's center point
    path.moveTo(0, 0);

    //Draw horizonal line from the center to the right, given user's length (a)
    path.lineTo(a, 0);

    double m;

    //Inclination of line in plane, given the angle between the line and x axis ("a" is our x axis)
    m = (tan(math.radians(angle)));

    //Ending point of b side (x2,y2)
    //Starting point of b side is ending point of side a aka (x1:0,y1:0);
    double x2;

    double y2;

    //Based on geometric equation of distance between 2 points
    //d^2=(x2-x1)^2+(y2-y1)^2

    //As we mentioned, x1=y1=0; y2=m*x2; d=b, thus we get the following identity
    if (angle <= 90) {
      x2 = sqrt(pow(b, 2) / (pow(m, 2) + 1));
    } else {
      x2 = -sqrt(pow(b, 2) / (pow(m, 2) + 1));
    }

    y2 = m * x2;

    //Draw line from (0,0) to (x2,-y2);
    path.lineTo(x2, -y2);

    //"Close" sides a and b by drawing line linking between them
    path.close();

    //Draw inner triangle based on the given coordinates (Inner triangle)
    Paint innerTriangle = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, innerTriangle);

    //Draw outer triangle based on the given coordinates (Triangle's sides)
    Paint outerTriangle = Paint()
      ..color = sideColor
      ..strokeWidth = sideWidth
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, outerTriangle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
