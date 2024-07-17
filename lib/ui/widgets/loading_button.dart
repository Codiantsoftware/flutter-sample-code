import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../util/constants/color_constants.dart';
import '../../util/helpers/theme_helper.dart';

class LoadingButton extends StatelessWidget {
  final double? width;
  final double height;
  final bool loading;
  final Function action;
  final bool enabled;
  final String title;
  final Color progressIndicatorColor;
  final Color textColor;
  final Color backGroundColor;
  final EdgeInsets padding;
  final BoxBorder? border;
  final Widget? child;

  const LoadingButton({
    Key? key,
    this.loading = false,
    this.enabled = true,
    this.width,
    this.height = 44.0,
    this.progressIndicatorColor = whiteColor,
    this.textColor = whiteColor,
    this.backGroundColor = purpleBlueColor,
    this.child,
    this.border,
    this.padding = EdgeInsets.zero,
    required this.action,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeHelper themeHelper = ThemeHelper(context: context);

    return AbsorbPointer(
      absorbing: loading,
      child: ElevatedButtonTheme(
        data: Theme.of(context).elevatedButtonTheme,
        child: MyElevatedButton(
          color: backGroundColor,
          border: border,
          padding: padding,
          width: width,
          height: height,
          onPressed: enabled ? () => action() : null,
          child: loading
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: progressIndicatorColor,
                  ),
                )
              : title.isNotEmpty
                  ? Text(
                      title.tr(),
                      style: themeHelper.textSizeMedium(
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : child ?? const SizedBox(),
        ),
      ),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Color color;
  final VoidCallback? onPressed;
  final Widget child;
  final BoxBorder? border;
  final EdgeInsets padding;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    required this.color,
    this.padding = EdgeInsets.zero,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeHelper themeHelper = ThemeHelper(context: context);

    final borderRadius = this.borderRadius ?? BorderRadius.circular(3);
    return Container(
      margin: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Container(
        width: width ?? themeHelper.sizeConfig.screenWidth,
        height: height,
        decoration: BoxDecoration(
          border: border,
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
