import 'package:flutter/material.dart';
import '../../util/constants/color_constants.dart';
import '../../util/helpers/theme_helper.dart';

class LoadingScreen extends StatelessWidget {
  final bool loading;
  final Widget child;

  const LoadingScreen({
    Key? key,
    required this.loading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeHelper themeHelper = ThemeHelper(context: context);
    return Stack(
      children: [
        child,
        if (loading)
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black45,
            child: Center(
              child: Container(
                height: themeHelper.sizeConfig.marginPadding65,
                width: themeHelper.sizeConfig.marginPadding65,
                padding: EdgeInsets.all(
                  themeHelper.sizeConfig.marginPadding18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CircularProgressIndicator(
                  color: purpleBlueColor,
                  strokeWidth: 2.5,
                ),
              ),
            ),
          )
      ],
    );
  }
}
