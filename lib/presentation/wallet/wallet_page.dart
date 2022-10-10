import 'package:flutter/material.dart';
import 'package:octagon_africa/application/services/utils.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/widgets/account_item.dart';
import 'package:octagon_africa/presentation/core/widgets/custom_app_bar.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const AccountItem(
              title: 'IPP/MK/8573975938/2020 - Pension',
              desc: 'Active sine June 2020',
            ),
            AccountItem(
              title: 'OIBL/MK/7874298429/2022 - Insurance',
              desc: 'Active sine January 2022',
              avatarColor: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
