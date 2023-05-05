import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  const InputComponent(
      {Key? key,
      required this.placeHolder,
      // this.label = "",
      this.icon,
      this.validator,
      this.obscureText = false,
      this.isAutoValidate = false,
      this.controller,
      this.maxLenght = 100,
      this.onTap,
      this.enabled,
      this.maxLines = 1,
      this.keyboardType})
      : super(key: key);

  final String placeHolder;
  // final String? label;
  final IconData? icon;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool isAutoValidate;
  final TextEditingController? controller;
  final int? maxLenght;
  final bool? enabled;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              // color: Color(0xFFE3E4E6),
              color: Colors.white,
            ),
            child: TextFormField(
              keyboardType: keyboardType,
              autovalidateMode: isAutoValidate
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              controller: controller,
              obscureText: obscureText!,
              maxLength: maxLenght!,
              enabled: enabled,
              maxLines: maxLines!,
              validator: validator,
              decoration: InputDecoration(
                suffixIcon: icon != null
                    ? InkWell(
                        onTap: onTap,
                        child: Icon(
                          icon,
                        ),
                      )
                    : null,
                counterText: "",
                hintText: placeHolder,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
