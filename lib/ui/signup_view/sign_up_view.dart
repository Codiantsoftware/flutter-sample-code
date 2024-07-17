import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_basic_structure/ui/widgets/cm_input_field.dart';
import 'package:flutter_basic_structure/ui/widgets/loading_screen.dart';
import 'package:flutter_basic_structure/util/constants/constants.dart';
import 'package:flutter_basic_structure/util/extensions/double_extension.dart';
import 'package:flutter_basic_structure/util/extensions/text_style_extension.dart';
import 'package:flutter_basic_structure/util/helpers/theme_helper.dart';
import '../../util/constants/color_constants.dart';
import '../../util/others/form_validation.dart';
import '../widgets/common_widget.dart';
import '../widgets/loading_button.dart';
import 'sign_up_view_model.dart';
import 'package:flutter_basic_structure/util/constants/image_constants.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  // Constructor for SignUpView widget
  const SignUpView({super.key});

  @override
  SignUpViewModel viewModelBuilder(BuildContext context) => SignUpViewModel();

  // Builder method to create the UI based on ViewModel state
  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
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

                // Build the sign-up form view
                _buildSignUpFormView(themeHelper, viewModel),
                themeHelper.sizeConfig.marginPadding20.buildVerticalSpace,

                // Sign-up button
                LoadingButton(
                  action: viewModel.signUpAction,
                  title: "signup_text",
                ),
                themeHelper.sizeConfig.marginPadding15.buildVerticalSpace,

                // Google sign-up button
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
                        "signUp_with_google".tr(),
                        style: themeHelper.textSizeSmall().semiBold,
                      ),
                    ],
                  ),
                ),
                themeHelper.sizeConfig.marginPadding40.buildVerticalSpace,

                // "Already have an account? Login" link
                RichText(
                  text: TextSpan(
                    text: "already_have_an_account_text".tr(),
                    style: themeHelper.textSizeSmall(
                      color: blackColor.withOpacity(.5),
                    ),
                    children: [
                      TextSpan(
                        text: 'login_text'.tr(),
                        style: themeHelper.textSizeSmall(decoration: TextDecoration.underline).semiBold,

                        // Recognizer for tap gesture to navigate to login view
                        recognizer: TapGestureRecognizer()..onTap = viewModel.navigateToLogin,
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

  // Build method for the sign-up form view
  Widget _buildSignUpFormView(
    ThemeHelper themeHelper,
    SignUpViewModel viewModel,
  ) {
    return Column(
      children: [
        // First name and last name input fields
        Row(
          children: [
            Expanded(
              child: CMInputFieldWidget(
                hint: "first_name",
                headingText: "first_name",
                controller: viewModel.firstNameController,
                keyboardType: TextInputType.name,
                validator: FormValidation.firstNameValidation,
              ),
            ),
            themeHelper.sizeConfig.marginPadding10.buildHorizontalSpace,
            Expanded(
              child: CMInputFieldWidget(
                hint: "last_name",
                headingText: "last_name",
                controller: viewModel.lastNameController,
                keyboardType: TextInputType.name,
                validator: FormValidation.lastNameValidation,
              ),
            ),
          ],
        ),

        // Email input field
        CMInputFieldWidget(
          hint: "hi@example.com",
          headingText: "email_text",
          controller: viewModel.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: FormValidation.emailValidation,
        ),

        // Phone number input field
        CMInputFieldWidget(
          hint: "phone_number",
          headingText: "phone",
          maxLength: 10,
          controller: viewModel.phoneNumberController,
          keyboardType: TextInputType.phone,
          validator: FormValidation.mobileValidation,
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
    SignUpViewModel viewModel,
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
