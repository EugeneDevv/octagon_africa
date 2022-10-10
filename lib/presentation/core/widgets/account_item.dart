import 'package:flutter/material.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    Key? key,
    required this.title,
    required this.desc,
    this.avatarColor,
  }) : super(key: key);

  final String title;
  final String desc;
  final Color? avatarColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.greyTextColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Text(
                  title,
                  style: boldSize18Text().copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                width: 36.0,
                height: 36.0,
                padding: const EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                    color: avatarColor ?? Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
              ),
            ],
          ),
          largeVerticalSizedBox,
          Text(
            desc,
            style: boldSize18Text(),
          ),
        ],
      ),
    );
  }
}
