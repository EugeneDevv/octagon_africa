import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/redux/actions/bottom_nav_action.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/navigation_drawer/drawer_item.dart';
import 'package:octagon_africa/presentation/core/widgets/navigation_drawer/header_widget.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';
import 'package:octagon_africa/presentation/router/routes.dart';

import '../../../../application/services/utils.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80.0, 24.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HeaderWidget(),
                largeVerticalSizedBox,
                DrawerItem(
                  name: 'Dashboard',
                  icon: Icons.home,
                  onTap: () => onItemPressed(context, 0),
                ),
                mediumVerticalSizedBox,
                DrawerItem(
                  name: 'Balance Enquiry',
                  icon: Icons.account_balance_wallet,
                  onTap: () => onItemPressed(context, 2),
                ),
                mediumVerticalSizedBox,
                const DrawerItem(
                  name: 'Statements',
                  icon: Icons.file_copy,
                ),
                mediumVerticalSizedBox,
                DrawerItem(
                  name: 'Deposits',
                  icon: Icons.amp_stories,
                  onTap: () => onItemPressed(context, 1),
                ),
                mediumVerticalSizedBox,
                const DrawerItem(
                  name: 'Claims',
                  icon: Icons.assignment,
                ),
                mediumVerticalSizedBox,
                DrawerItem(
                  name: 'Help',
                  icon: Icons.help_outline,
                  onTap: () => onItemPressed(context, 0),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.loginPage,
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: SizedBox(
                    height: 40,
                    child: Row(children: <Widget>[
                      const Icon(
                        Icons.logout,
                        size: 20.0,
                        color: AppColors.whiteColor,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        'Logout',
                        style: boldSize18Text(AppColors.whiteColor),
                      ),
                    ]),
                  ),
                ),
                veryLargeVerticalSizedBox,
                Text(
                  'Version 1.0.0',
                  style: boldSize18Text(AppColors.whiteColor),
                ),
                largeVerticalSizedBox,
              ]),
        ),
      ),
    );
  }
}

void onItemPressed(BuildContext context, int index) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
  StoreProvider.dispatch<AppState>(
    context,
    BottomNavAction(currentBottomNavIndex: index, barTitle: getBarTitle(index)),
  );
}
