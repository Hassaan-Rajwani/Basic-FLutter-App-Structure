import 'package:flutter/material.dart';

ScaffoldFeatureController snackBarComponent(context,
    {required Color color, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: color,
    content: Text(
      message,
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: Theme.of(context).primaryColor),
    ),
  ));
}
