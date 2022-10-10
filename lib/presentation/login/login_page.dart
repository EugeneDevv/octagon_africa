import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/services/app_strings.dart';
import 'package:octagon_africa/application/services/utils.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/authentication_scaffold.dart';
import 'package:octagon_africa/presentation/core/widgets/buttons.dart';
import 'package:octagon_africa/presentation/core/widgets/inputs.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';
import 'package:octagon_africa/presentation/router/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  final TextEditingController emailInputController = TextEditingController();

  String? pin;
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final bool activateActionButton =
        pin != null && pin!.isNotEmpty && email != null && email!.isNotEmpty;
    return Form(
      key: _formKey,
      child: AuthScaffold(
        title: loginTitleString,
        message: loginDescString,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              emailString,
              style: boldSize14Text(Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,
            CustomTextField(
              customFillColor: AppColors.inputFillColor,
              borderColor: AppColors.lightGreyColor,
              focusedBorderColor: AppColors.greyTextColor,
              validator: userEmailValidator,
              hintText: emailHintString,
              autovalidateMode: AutovalidateMode.disabled,
              onChanged: (String? val) {
                setState(() {
                  email = val;
                });
              },
            ),
            largeVerticalSizedBox,
            Text(
              passwordString,
              style: boldSize14Text(Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,
            CustomTextField(
              customFillColor: AppColors.inputFillColor,
              borderColor: AppColors.lightGreyColor,
              focusedBorderColor: AppColors.greyTextColor,
              obscureText: true,
              validator: userPinValidator,
              hintText: passwordHintString,
              autovalidateMode: AutovalidateMode.disabled,
              onChanged: (String? val) {
                setState(() {
                  pin = val;
                });
              },
            ),
            largeVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                        checkColor: AppColors.blackColor,
                        fillColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        side: const BorderSide(
                          color: AppColors.greyTextColor,
                        ),
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                    ),
                    verySmallHorizontalSizedBox,
                    Text(
                      rememberMeString,
                      style: boldSize14Text(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    final bool? isFormValid = _formKey.currentState?.validate();
                    if (isFormValid != null && isFormValid && email != null) {
                      Navigator.of(context).pushReplacementNamed(
                        AppRoutes.verifyPhonePage,
                        arguments: email,
                      );
                    }
                  },
                  child: Text(
                    forgotPasswordString,
                    style:
                        boldSize14Text(Theme.of(context).colorScheme.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
        actionButton: PrimaryButton(
          text: loginString,
          onPressed: !activateActionButton
              ? null
              : () {
                  final bool? isFormValid = _formKey.currentState?.validate();

                  if (isFormValid != null &&
                      isFormValid &&
                      pin != null &&
                      email != null) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.homePage,
                      (Route<dynamic> route) => false,
                    );
                  }
                },
          buttonColor: activateActionButton
              ? null
              : AppColors.greyTextColor.withOpacity(0.6),
        ),
        actionDescription: RichText(
          text: TextSpan(
            text: doNotHaveAnAccountString,
            style: normalSize13Text(
              AppColors.greyTextColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' $signUpString',
                style: normalSize13Text(
                  Theme.of(context).primaryColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.registerPage,
                      arguments: email,
                    );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
