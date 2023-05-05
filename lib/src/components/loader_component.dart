import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  const LoaderComponent({
    super.key,
    this.height,
  });

  final dynamic height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }
}
