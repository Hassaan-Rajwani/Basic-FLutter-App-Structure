import 'package:flutter/material.dart';

class AppButtonComponent extends StatelessWidget {
  const AppButtonComponent({
    Key? key,
    required this.title,
    required this.onPress,
    required this.isLoading,
    this.marginTop = 0,
    this.marginBottom = 20,
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final bool isLoading;
  final double marginTop;
  final double marginBottom;
  final IconData? icon;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, marginTop, 35, marginBottom),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPress,
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title),
                      const SizedBox(width: 10),
                      Icon(icon),
                    ],
                  )
                : Text(
                    title,
                  ),
      ),
    );
  }
}
