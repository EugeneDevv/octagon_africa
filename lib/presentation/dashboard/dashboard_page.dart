import 'package:flutter/material.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/widgets/custom_app_bar.dart';
import 'package:octagon_africa/presentation/core/widgets/greetings_component.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

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
              'June 12th',
              style: boldSize14Text(),
            ),
            size15VerticalSizedBox,
            const GreetingComponent()
          ],
        ),
      ),
    );
  }
}
