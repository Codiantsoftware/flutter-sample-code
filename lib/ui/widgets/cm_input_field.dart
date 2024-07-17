import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_structure/util/extensions/double_extension.dart';
import 'package:flutter_basic_structure/util/helpers/theme_helper.dart';
import '../../util/constants/color_constants.dart';

class CMInputFieldWidget extends StatelessWidget {
  final IconData? icon;
  final ImageProvider? imageProvider;
  final String hint;
  final String headingText;
  final String errorMsgValidation;
  final bool isMobileNumber;
  final Color? fillColor;
  final double borderRadius;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final bool isPassword;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String prefixIcon;
  final bool? isDense;
  final String? helperText;
  final bool enabled;
  final double horizontalPadding;
  final bool hideIconTextDivider;
  final TextInputType? keyboardType;
  final EdgeInsets contentPadding;
  final Function(String)? onFieldSubmitted;
  final int? maxInputLength;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final String? labelText;
  final int maxLength;
  final bool obscureText;

  const CMInputFieldWidget({
    Key? key,
    this.icon,
    this.hintStyle,
    this.maxLength = 30,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.errorStyle,
    this.imageProvider,
    this.labelText,
    this.errorMsgValidation = "",
    this.headingText = "",
    this.readOnly = false,
    this.hint = "",
    this.isMobileNumber = false,
    this.controller,
    this.borderRadius = 10,
    this.helperText,
    this.onFieldSubmitted,
    this.validator,
    this.textStyle,
    this.focusNode,
    this.isDense,
    this.contentPadding = EdgeInsets.zero,
    this.enabled = true,
    this.isPassword = false,
    this.suffix,
    this.suffixIcon,
    this.prefixIcon = "",
    this.horizontalPadding = 6.5,
    this.hideIconTextDivider = false,
    this.keyboardType,
    this.fillColor,
    this.maxInputLength,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeHelper themeHelper = ThemeHelper(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headingText.isNotEmpty)
          Text(
            headingText.tr(),
            overflow: TextOverflow.ellipsis,
            style: themeHelper.textCustomSize(
              fontWeight: FontWeight.w600,
              color: blackColor,
              fontSize: themeHelper.sizeConfig.marginPadding13,
            ),
          ),
        if (headingText.isNotEmpty) themeHelper.sizeConfig.marginPadding8.buildVerticalSpace,
        TextFormField(
          maxLength: maxLength,
          keyboardType: keyboardType ?? TextInputType.text,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            counterText: '',
            errorMaxLines: 3,
            filled: true,
            fillColor: hawkesBlueColor.withOpacity(0.4),
            suffix: suffix,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(10),
            hintText: hint.tr(),
            hintStyle: const TextStyle(
              color: textCloudyGreyColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: hawkesBlueColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: hawkesBlueColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: hawkesBlueColor),
            ),
          ),
        ),
        if (errorMsgValidation.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4),
            child: Text(
              errorMsgValidation,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        themeHelper.sizeConfig.marginPadding15.buildVerticalSpace,
      ],
    );
  }
}
