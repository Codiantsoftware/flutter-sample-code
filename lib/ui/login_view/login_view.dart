import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_basic_structure/ui/widgets/cm_input_field.dart';
import 'package:flutter_basic_structure/ui/widgets/loading_button.dart';
import 'package:flutter_basic_structure/ui/widgets/loading_screen.dart';
import 'package:flutter_basic_structure/util/constants/image_constants.dart';
import 'package:flutter_basic_structure/util/extensions/double_extension.dart';
import 'package:flutter_basic_structure/util/extensions/text_style_extension.dart';
import 'package:flutter_basic_structure/util/helpers/theme_helper.dart';
import 'package:flutter_basic_structure/util/others/form_validation.dart';
import '../../util/constants/color_constants.dart';
import '../../util/constants/constants.dart';
import '../widgets/common_widget.dart';
import 'login_view_model.dart';

class LoginView extends StackedView<LoginViewModel> {
  // Constructor for LoginView widget
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  // Builder method to create the UI based on ViewModel state
  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    // Helper instance for managing theme
    final themeHelper = ThemeHelper(context: context);

    // Return LoadingScreen widget with the main Scaffold structure
    return LoadingScreen(
      loading: viewModel.isBusy,
      child: Scaffold(
        body: SingleChildScrollView(
          // Apply horizontal padding to the entire content
          padding: edgeInsetsHorizontalPadding15,
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Build the heading view
                _buildHeadingView(themeHelper, viewModel),
                themeHelper.sizeConfig.marginPadding29.buildVerticalSpace,

                // Build the login form view
                _buildLoginFormView(themeHelper, viewModel),

                // "Forgot Password?" link
                InkWell(
                  onTap: viewModel.featureNotAvailableAction,
                  child: Text(
                    "forgot_password_text".tr(),
                    style: themeHelper.textSizeSmall(
                      color: purpleBlueColor,
                    ),
                  ),
                ),
                themeHelper.sizeConfig.marginPadding20.buildVerticalSpace,

                // Login button
                LoadingButton(
                  action: viewModel.loginAction,
                  title: "login_text",
                ),
                themeHelper.sizeConfig.marginPadding15.buildVerticalSpace,

                // Google login button
                LoadingButton(
                  action: viewModel.featureNotAvailableAction,
                  title: "",
                  backGroundColor: whiteColor,
                  border: Border.all(color: lightPurpleBlueColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      svgPictureWidget(
                        path: ImageConstants.icGoogle,
                      ),
                      themeHelper.sizeConfig.marginPadding5.buildHorizontalSpace,
                      Text(
                        "continue_with_google".tr(),
                        style: themeHelper.textSizeSmall().semiBold,
                      ),
                    ],
                  ),
                ),
                themeHelper.sizeConfig.marginPadding40.buildVerticalSpace,

                // "Don't have an account? Sign up for free" link
                RichText(
                  text: TextSpan(
                    text: "dont_have_an_account_text".tr(),
                    style: themeHelper.textSizeSmall(
                      color: blackColor.withOpacity(.5),
                    ),
                    children: [
                      TextSpan(
                        text: 'signup_free'.tr(),
                        style: themeHelper.textSizeSmall(decoration: TextDecoration.underline).semiBold,
                        recognizer: TapGestureRecognizer()..onTap = viewModel.navigateToSignUp,
                      ),
                    ],
                  ),
                ),
                themeHelper.sizeConfig.marginPadding24.buildVerticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build method for the login form view
  Widget _buildLoginFormView(
    ThemeHelper themeHelper,
    LoginViewModel viewModel,
  ) {
    return Column(
      children: [
        // Email input field
        CMInputFieldWidget(
          hint: "hi@example.com",
          headingText: "email_text",
          controller: viewModel.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: FormValidation.emailValidation,
        ),

        // Password input field
        CMInputFieldWidget(
          hint: "Enter password",
          headingText: "password_text",
          controller: viewModel.passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: FormValidation.passwordValidation,
          obscureText: viewModel.isShowPassword,

          // Toggle visibility icon
          suffixIcon: InkWell(
            onTap: viewModel.passwordIsVisible,
            child: Icon(
              !viewModel.isShowPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: textCloudyGreyColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  // Build method for the heading view
  Widget _buildHeadingView(
    ThemeHelper themeHelper,
    LoginViewModel viewModel,
  ) {
    return Column(
      children: [
        // Logo image
        themeHelper.sizeConfig.marginPadding50.buildVerticalSpace,
        svgPictureWidget(
          path: ImageConstants.icLogoTitle,
        ),
        themeHelper.sizeConfig.marginPadding40.buildVerticalSpace,

        // "Welcome Back" title
        Text(
          "welcome_back".tr(),
          style: themeHelper.textSizeXLarge(color: blackColor).bold,
        ),
        themeHelper.sizeConfig.marginPadding15.buildVerticalSpace,

        // Subtitle
        Text(
          "welcome_back_subtitle".tr(),
          style: themeHelper.textSizeSmall(color: blackColor.withOpacity(.5)).regular,
        ),
      ],
    );
  }
}
