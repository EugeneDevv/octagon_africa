import 'package:flutter/material.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class AuthScaffold extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? body;
  final Widget? actionDescription;
  final Widget actionButton;

  const AuthScaffold({
    Key? key,
    this.title,
    this.message,
    this.body,
    this.actionDescription,
    required this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    veryLargeVerticalSizedBox,
                    Text(
                      title ?? '',
                      style: veryBoldSize22Text(),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      message ?? '',
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                    veryLargeVerticalSizedBox,
                    if (body != null) body!,
                    veryLargeVerticalSizedBox,
                    actionButton,
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      if (actionDescription != null) actionDescription!,
                      veryLargeVerticalSizedBox,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
