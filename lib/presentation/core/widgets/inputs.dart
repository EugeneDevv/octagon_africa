// ignore_for_file: avoid_dynamic_calls, use_decorated_box

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octagon_africa/application/services/app_strings.dart';
import 'package:octagon_africa/application/services/utils.dart';
import 'package:octagon_africa/domain/value_objects/enums.dart';
import 'package:octagon_africa/domain/value_objects/types.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:rxdart/rxdart.dart';

/// [PhoneInput] is a shared widget to input user phone number and
/// country code
///
/// It takes in required [onChanged] and [phoneNumberFormatter] parameters
///
/// The [phoneNumberFormatter] function takes in countyCode and phoneNumber
///  to return a standard phoneNumber string
class PhoneInput extends FormField<String> {
  PhoneInput({
    Key? textFormFieldKey,
    TextEditingController? controller,
    required FormFieldSetter<String> onChanged,
    required PhoneNumberFormatterFunc phoneNumberFormatter,
    TextStyle? style,
    bool? enabled,
    bool? autoFocus,
    String? initialValue,
    InputDecoration? decoration,
    AutovalidateMode? autovalidateMode,
    bool isValidNumber = false,
    bool showAlertIcon = false,
    bool showBorder = false,
    Color? borderColor,
  })  : assert(
          initialValue == null || controller == null,
          'initialValue and controller should not be used together.',
        ),
        super(
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          validator: (String? value) {
            final PhoneInputBehaviorSubject phoneInputBehaviorSubject =
                PhoneInputBehaviorSubject();

            final String countryCode =
                phoneInputBehaviorSubject.countryCode.valueOrNull!;

            if (value != null) {
              if (value.isEmpty) {
                isValidNumber = showAlertIcon;
                return phoneNumberRequiredText;
              }

              String phone;

              if (value.startsWith('0')) {
                phone = value.substring(1);
              } else {
                phone = value;
              }

              if (!isValidPhoneNumber('$countryCode$phone')) {
                isValidNumber = showAlertIcon;
                return validPhoneNumberText;
              }

              isValidNumber = !showAlertIcon;
            }
            return null;
          },
          builder: (FormFieldState<String> state) {
            final PhoneInputBehaviorSubject phoneInputBehaviorSubject =
                PhoneInputBehaviorSubject();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: showBorder
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: borderColor ?? Colors.black,
                          ),
                        )
                      : null,
                  child: Row(
                    children: <Widget>[
                      verySmallHorizontalSizedBox,
                      Container(
                        height: 48,
                        decoration: showBorder
                            ? BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: borderColor ?? Colors.black,
                                    width: 2,
                                  ),
                                ),
                              )
                            : null,
                        child: CountryPicker(
                          onChanged: (String value) {
                            phoneInputBehaviorSubject.countryCode.add(value);
                            onChanged(
                              phoneNumberFormatter(
                                countryCode: phoneInputBehaviorSubject
                                        .countryCode.valueOrNull ??
                                    '',
                                phoneNumber: phoneInputBehaviorSubject
                                        .phoneNumber.valueOrNull ??
                                    '',
                              ),
                            );
                          },
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 48,
                          child: TextFormField(
                            autofocus: autoFocus ?? false,
                            key: textFormFieldKey,
                            decoration: decoration,
                            
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: style,
                            onChanged: (String value) {
                              state.didChange(value);
                              controller?.text = value;
                              phoneInputBehaviorSubject.phoneNumber.add(value);
                              onChanged(
                                phoneNumberFormatter(
                                  countryCode: phoneInputBehaviorSubject
                                      .countryCode.valueOrNull!,
                                  phoneNumber: value,
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      state.errorText.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
              ],
            );
          },
        );
}

class PhoneInputBehaviorSubject {
  static final PhoneInputBehaviorSubject _singleton =
      PhoneInputBehaviorSubject._internal();

  factory PhoneInputBehaviorSubject() {
    return _singleton;
  }

  PhoneInputBehaviorSubject._internal();

  BehaviorSubject<String> countryCode = BehaviorSubject<String>.seeded('+254');
  BehaviorSubject<String> phoneNumber = BehaviorSubject<String>();
}

/// [CountryPicker] is used in [PhoneInput] select Country Code
///
/// It takes in a required [onChanged] parameter
class CountryPicker extends StatefulWidget {
  const CountryPicker({
    super.key,
    this.selectCountryKey,
    required this.onChanged,
  });

  final void Function(String) onChanged;
  final Key? selectCountryKey;

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  PhoneInputBehaviorSubject phoneInputBehaviorSubject =
      PhoneInputBehaviorSubject();

  Country _country = Country.kenya;

  @override
  Widget build(BuildContext context) {
    final String countryCode = getCountry(_country)!['code']!;
    phoneInputBehaviorSubject.countryCode.add(countryCode);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      key: widget.selectCountryKey,
      onTap: () async {
        final Country? _result = await selectCountryModalBottomSheet(context);
        if (_result != null) {
          setState(() {
            _country = _result;
          });
          widget.onChanged(countryCode);
          phoneInputBehaviorSubject.countryCode.add(countryCode);
        }
      },
      child: Row(
        children: <Widget>[
          Text(
            getCountry(this._country)!['code']!,
            key: const Key('countrySelectedKey'),
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            getCountry(this._country)!['flag']!,
            height: 20,
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}


/// A wrapper for [TextFormField] that contains options for a field label.
class CustomTextField extends StatelessWidget {
  /// A wrapper for [TextFormField] that contains options for a field label.
  ///
  /// For the label to appear the [fieldLabel] must be specified.
  /// If [fieldLabel] is specified and [isRequired] is true, then a red asterisk
  /// is added to the label.
  ///
  /// For a documentation about the various parameters, see [TextFormField].
 const CustomTextField({Key? key, 
    bool? enabled,
    bool? obscureText,
    this.formFieldKey,
    this.focusNode,
    this.fieldLabel,
    this.controller,
    this.onChanged,
    this.hintText,
    this.hintColor,
    this.onSubmitted,
    this.customFillColor,
    this.maxLines,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.borderColor,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.isRequired,
    this.autovalidateMode,
    this.labelStyle,
    this.focusedBorderColor,
  })  : enabled = enabled ?? true,
        obscureText = obscureText ?? false, super(key: key);

  final AutovalidateMode? autovalidateMode;
  final Color? borderColor;
  final Key? formFieldKey;
  final TextEditingController? controller;
  final Color? customFillColor;
  final bool enabled;
  final String? fieldLabel;
  final FocusNode? focusNode;
  final Color? hintColor;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  // An indicator in the label text to show if this input is required
  final bool? isRequired;

  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  // Whether to obscure text. Defaults to `false`
  final bool obscureText;

  final OnChangedString? onChanged;
  final OnChangedString? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextStyle? labelStyle;
  final Color? focusedBorderColor;

  bool alignLabelWithHint(int? maxLines) => maxLines != null && maxLines > 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> labels = <Widget>[];
    if (fieldLabel != null) {
      labels.addAll(
        <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: TextFormHintText(
              hintText: fieldLabel!,
              isRequired: isRequired,
            ),
          ),
          smallVerticalSizedBox,
        ],
      );
    }

    return Column(
      children: <Widget>[
        ...labels,
        TextFormField(
          maxLength: maxLength,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.always,
          enabled: enabled,
          key: formFieldKey,
          onFieldSubmitted: onSubmitted,
          onChanged: onChanged,
          focusNode: focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: (!enabled)
                ? Colors.grey[200]
                : customFillColor ?? AppColors.whiteColor,
            alignLabelWithHint: alignLabelWithHint(maxLines),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            labelText: labelText,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                  color: hintColor ?? AppColors.lightGreyColor,
                  fontSize: 16,
                ),
            suffixIcon: suffixIcon,
            suffixIconConstraints:
                const BoxConstraints(minHeight: 24, minWidth: 24),
            prefixIcon: prefixIcon,
            labelStyle: labelStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                  fontSize: 15,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? customFillColor ?? Colors.white24,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? AppColors.lightGreyColor),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ??
                    Theme.of(context).colorScheme.secondary,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.wrongPinTextColor),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.wrongPinTextColor),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusColor: Theme.of(context).colorScheme.secondary,
          ),
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}

class TextFormHintText extends StatelessWidget {
  const TextFormHintText({Key? key, 
    required this.hintText,
    bool? isRequired,
  }) : isRequired = isRequired ?? false, super(key: key);

  final String hintText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return Row(
        children: <Widget>[
          HintText(hintText: hintText),
          Flexible(
            child:
                Text('*', style: heavySize20Text(AppColors.wrongPinTextColor)),
          )
        ],
      );
    }

    return HintText(hintText: hintText);
  }
}

class HintText extends StatelessWidget {
  const HintText({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: heavySize18Text(AppColors.lightGreyColor),
    );
  }
}

/// [PINInputField] is a shared widget to input authentication PIN
///
/// It takes in a required [maxLength] parameter to specify the number of PIN input fields

class PINInputField extends StatelessWidget {
  const PINInputField({
    super.key,
    required this.maxLength,
    required this.onDone,
    this.onTextChanged,
    this.autoFocus = false,
    this.wrapAlignment = WrapAlignment.spaceBetween,
    this.pinBoxHeight = 48.0,
    this.pinBoxWidth = 48.0,
    this.controller,
    this.keyboardType = TextInputType.number,
    this.focusNode,
    this.hasTextBorderColor = AppColors.greyTextColor,
  });
  final bool? autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int? maxLength;
  final Function onDone;
  final Function? onTextChanged;
  final double? pinBoxHeight;
  final double? pinBoxWidth;
  final WrapAlignment? wrapAlignment;
  final Color hasTextBorderColor;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autofocus: autoFocus!,
      hideCharacter: true,
      pinBoxBorderWidth: 1,
      highlight: true,
      focusNode: focusNode,
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
      defaultBorderColor: AppColors.lightGreyColor,
      hasTextBorderColor: hasTextBorderColor,
      maxLength: maxLength ?? 6,
      maskCharacter: '⚫',
      pinBoxWidth: pinBoxWidth!,
      pinBoxHeight: pinBoxHeight!,
      wrapAlignment: wrapAlignment!,
      pinBoxDecoration: customRoundedPinBoxDecoration,
      pinTextStyle: const TextStyle(fontSize: 10.0),
      pinTextAnimatedSwitcherTransition:
          ProvidedPinBoxTextAnimation.scalingTransition,
      pinBoxColor: Theme.of(context).backgroundColor,
      pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
      highlightAnimationBeginColor: Colors.black,
      highlightAnimationEndColor: Colors.white12,
      keyboardType: keyboardType,
      onDone: (String val) {
        onDone(val);
      },
      onTextChanged: (String val) =>
          (onTextChanged == null) ? <dynamic>{} : onTextChanged!(val),
    );
  }
}

BoxDecoration customRoundedPinBoxDecoration(
  /// [BoxDecoration] box decoration for [PinCodeTextField] widget

  Color borderColor,
  Color pinBoxColor, {
  double borderWidth = 1.0,
  double? radius,
}) {
  return BoxDecoration(
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
    color: pinBoxColor,
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );
}
