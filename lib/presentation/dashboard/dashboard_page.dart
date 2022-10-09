import 'package:flutter/material.dart';
import 'package:octagon_africa/application/services/utils.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/widgets/custom_app_bar.dart';
import 'package:octagon_africa/presentation/core/widgets/greetings_component.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';
import 'package:octagon_africa/presentation/core/widgets/summary_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showLeadingIcon: true,
        title: 'DASHBOARD',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            size15VerticalSizedBox,
            Text(
              formatDate(),
              style: boldSize14Text(),
            ),
            size15VerticalSizedBox,
            const GreetingComponent(),
            size15VerticalSizedBox,
            Text(
              'Overview',
              style: veryBoldSize16Text(),
            ),
            size15VerticalSizedBox,
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              spacing: 20,
              children: const <Widget>[
                SummaryCard(
                  count: '2',
                  title: 'Accounts',
                ),
                SummaryCard(
                  count: '1500',
                  title: 'Transactions',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
