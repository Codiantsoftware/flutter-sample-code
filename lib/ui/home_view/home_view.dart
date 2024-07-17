import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_structure/ui/widgets/loading_screen.dart';
import 'package:flutter_basic_structure/util/extensions/double_extension.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_basic_structure/util/constants/color_constants.dart';
import 'package:flutter_basic_structure/util/extensions/text_style_extension.dart';
import 'package:flutter_basic_structure/util/helpers/theme_helper.dart';
import '../../util/constants/image_constants.dart';
import '../widgets/common_widget.dart';
import 'home_view_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  // Constructor for HomeView widget
  const HomeView({Key? key}) : super(key: key);

  // Build method for HomeView widget
  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  // Builder method to create the UI based on ViewModel state
  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    // Helper class for managing theme-related configurations
    final themeHelper = ThemeHelper(context: context);

    // Function to build detail field widget with title, description, and optional divider
    Widget buildCMDetailFieldWidget({
      String title = "",
      String description = "",
      bool hideDivider = true,
    }) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: hideDivider ? BorderSide(color: purpleBlueColor.withOpacity(0.2)) : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.tr(),
              style: themeHelper.textSizeMedium(color: textCloudyGreyColor),
            ),
            Text(
              description.tr(),
              style: themeHelper.textSizeMedium(),
            )
          ],
        ),
      );
    }

    // Return LoadingScreen widget with the main application scaffold
    return LoadingScreen(
      loading: viewModel.isBusy,
      child: Scaffold(
        // App bar configuration
        appBar: AppBar(
          backgroundColor: purpleBlueColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "home".tr(),
            style: themeHelper.textSizeLarge(color: whiteColor).bold,
          ),
          actions: [
            InkWell(
              onTap: viewModel.logOutAction,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.logout_outlined,
                  size: themeHelper.sizeConfig.marginPadding24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        // Main body of the application
        body: SizedBox(
          height: themeHelper.sizeConfig.screenHeight,
          width: themeHelper.sizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              themeHelper.sizeConfig.marginPadding40.buildVerticalSpace,
              // SVG picture widget for the logo/title
              svgPictureWidget(
                path: ImageConstants.icLogoTitle,
              ),
              themeHelper.sizeConfig.marginPadding40.buildVerticalSpace,
              // Container for user details with specific styling
              Container(
                width: themeHelper.sizeConfig.screenWidth,
                margin: EdgeInsets.all(
                  themeHelper.sizeConfig.marginPadding20,
                ),
                padding: EdgeInsets.all(
                  themeHelper.sizeConfig.marginPadding15,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: purpleBlueColor.withOpacity(0.2),
                  ),
                ),
                // Column of detail field widgets
                child: Column(
                  children: [
                    buildCMDetailFieldWidget(
                      title: "first_name",
                      description: viewModel.user.firstName,
                    ),
                    buildCMDetailFieldWidget(
                      title: "last_name",
                      description: viewModel.user.lastName,
                    ),
                    buildCMDetailFieldWidget(
                      title: "email_text",
                      description: viewModel.user.email,
                    ),
                    buildCMDetailFieldWidget(
                      hideDivider: false,
                      title: "phone",
                      description: viewModel.user.phoneNumber,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
