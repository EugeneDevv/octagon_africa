import 'package:async_redux/async_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/redux/actions/update_onboarding_state_action.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/services/app_strings.dart';
import 'package:octagon_africa/application/services/utils.dart';
import 'package:octagon_africa/domain/value_objects/constants.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/authentication_scaffold.dart';
import 'package:octagon_africa/presentation/core/widgets/buttons.dart';
import 'package:octagon_africa/presentation/core/widgets/inputs.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';
import 'package:octagon_africa/presentation/router/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? firstName;

  String? lastName;

  String? phoneNumber;

  String? email;

  final TextEditingController emailInputController = TextEditingController();

  String? pin;
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final bool activateActionButton = pin != null &&
        pin!.isNotEmpty &&
        phoneNumber != null &&
        phoneNumber!.isNotEmpty &&
        firstName != null &&
        firstName!.isNotEmpty &&
        lastName != null &&
        lastName!.isNotEmpty &&
        email != null &&
        email!.isNotEmpty;
    return Form(
      key: _formKey,
      child: AuthScaffold(
        title: registerTitleString,
        message: registerDescString,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      firstNameString,
                      style: boldSize14Text(Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.22,
                      child: CustomTextField(
                        customFillColor: AppColors.inputFillColor,
                        hintText: firstNameHintString,
                        borderColor: AppColors.lightGreyColor,
                        focusedBorderColor: AppColors.greyTextColor,
                        autovalidateMode: AutovalidateMode.disabled,
                        onChanged: (String? value) {
                          setState(() {
                            firstName = value;
                          });
                        },
                        validator: nameValidator,
                      ),
                    ),
                  ],
                ),
                verySmallHorizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      lastNameString,
                      style: boldSize14Text(Theme.of(context).primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.22,
                      child: CustomTextField(
                        customFillColor: AppColors.inputFillColor,
                        borderColor: AppColors.lightGreyColor,
                        hintText: lastNameHintString,
                        focusedBorderColor: AppColors.greyTextColor,
                        autovalidateMode: AutovalidateMode.disabled,
                        onChanged: (String? value) {
                          setState(() {
                            lastName = value;
                          });
                        },
                        validator: nameValidator,
                      ),
                    ),
                  ],
                )
              ],
            ),
            largeVerticalSizedBox,
            Text(
              emailAddressString,
              style: boldSize14Text(Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,
            CustomTextField(
              customFillColor: AppColors.inputFillColor,
              borderColor: AppColors.lightGreyColor,
              focusedBorderColor: AppColors.greyTextColor,
              hintText: emailHintString,
              autovalidateMode: AutovalidateMode.disabled,
              onChanged: (String? value) {
                setState(() {
                  email = value;
                });
              },
              validator: userEmailValidator,
            ),
            largeVerticalSizedBox,
            Text(
              phoneNumberString,
              style: boldSize14Text(Theme.of(context).primaryColor),
              textAlign: TextAlign.center,
            ),
            smallVerticalSizedBox,
            PhoneInput(
              showBorder: true,
              borderColor: AppColors.lightGreyColor,
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                filled: true,
                fillColor: AppColors.inputFillColor,
                hintText: phoneNumberHintString,
              ),
              onChanged: (String? val) {
                setState(() {
                  phoneNumber = val;
                });
              },
              phoneNumberFormatter: formatPhoneNumber,
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
          text: signUpString,
          onPressed: () {
            final bool? isFormValid = _formKey.currentState?.validate();
            if (isFormValid != null && isFormValid && activateActionButton) {
              StoreProvider.dispatch<AppState>(
                context,
                UpdateOnboardingStateAction(
                  firstName: firstName,
                  lastName: lastName,
                  email: email,
                  phoneNumber: phoneNumber,
                  password: pin,
                ),
              );
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.homePage,
                (Route<dynamic> route) => false,
              );
            }
          },
        ),
        actionDescription: RichText(
          text: TextSpan(
            text: alreadyHaveAnAccountString,
            style: normalSize13Text(
              AppColors.greyTextColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' $loginString',
                style: normalSize13Text(
                  Theme.of(context).primaryColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.loginPage,
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
