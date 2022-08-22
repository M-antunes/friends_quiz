import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> callMessageSnackbar(
        BuildContext context, String text, color, int? duration) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.symmetric(horizontal: 12),
        duration: Duration(milliseconds: duration ?? 1800),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: color,
        content: Text(
          text,
          style: const TextStyle(fontFamily: 'Regular', fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
