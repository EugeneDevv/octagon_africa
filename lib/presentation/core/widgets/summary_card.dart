import 'package:flutter/material.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: (MediaQuery.of(context).size.width / 2) - 30,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: boldSize13Text(),
              textAlign: TextAlign.center,
            ),
          ),
          smallVerticalSizedBox,
          Text(
            count,
            style: veryBoldSize32Text().copyWith(fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          smallVerticalSizedBox,
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'View',
              style: boldSize12Text(Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
