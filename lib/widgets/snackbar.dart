import 'package:flutter/material.dart';

import '../constants/constants.dart';

SnackBar buildSnackBar({
  required String snackBarContent,
  required int milliseconds,
  required double width,
}) {
  return SnackBar(
    padding: const EdgeInsets.all(5),
    width: width,
    behavior: SnackBarBehavior.floating,
    backgroundColor: kPrimaryButtons,
    elevation: 1,
    content: Text(
      snackBarContent,
      textAlign: TextAlign.center,
      style: kTextPrimary.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    duration: Duration(milliseconds: milliseconds),
  );
}
