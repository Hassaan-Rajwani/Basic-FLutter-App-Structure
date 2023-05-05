import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/app.dart';
import 'package:task/src/model/user_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserDetailModal(),
        ),
      ],
      child: const App(),
    ),
  );
}
