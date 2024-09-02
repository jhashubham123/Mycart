import 'package:flutter/material.dart';
import 'package:mycart/app/theme/theme.dart';

class AppTextfield {
  static Widget appInputField({
    required String hintText,
    Widget? suffixIcon,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool obscureText = false,
  }) {
    return TextFormField(
      cursorColor: AppColors.textFieldBorderColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppTextStyles.hintStyle,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldBorderColor))),
    );
  }

  /// App Search textfield
  static Widget appSearchTextfield({
    Widget? prefixIcon,
    required String hintText,
  }) {
    return TextFormField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColors.whiteColor,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }
}
