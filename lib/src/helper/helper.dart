import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

String emailRegex =
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
String nameRegex = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
String phoneRegex = r"^(1\s?)?(\d{3}|\(\d{3}\))[\s\-]?\d{3}[\s\-]?\d{4}$";
String socialSecurityRegex = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';

mediaScreenHeight({required context, num? iosHeight, num? androidHeight}) {
  return defaultTargetPlatform == TargetPlatform.iOS
      ? iosHeight != null
          ? MediaQuery.of(context).size.height * iosHeight
          : MediaQuery.of(context).size.height * 0.75
      : androidHeight != null
          ? MediaQuery.of(context).size.height * androidHeight
          : MediaQuery.of(context).size.height * 0.775;
}
