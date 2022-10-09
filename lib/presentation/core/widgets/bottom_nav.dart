import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:octagon_africa/application/redux/actions/bottom_nav_action.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/dashboard/dashboard_page.dart';
import 'package:octagon_africa/presentation/deposits/deposits_page.dart';
import 'package:octagon_africa/presentation/faqs/faqs_page.dart';
import 'package:octagon_africa/presentation/profile/profile_page.dart';
import 'package:octagon_africa/presentation/wallet/wallet_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
        child: GNav(
            tabBackgroundColor: Theme.of(context).primaryColor,
            backgroundColor: AppColors.whiteColor,
            activeColor: AppColors.whiteColor,
            padding: const EdgeInsets.all(10.0),
            gap: 4.0,
            onTabChange: (int currentIndex) {
              StoreProvider.dispatch<AppState>(
                context,
                BottomNavAction(currentBottomNavIndex: currentIndex),
              );
            },
            tabs: const <GButton>[
              GButton(
                icon: Icons.home,
                text: 'Dashboard',
              ),
              GButton(
                icon: Icons.amp_stories,
                text: 'Deposits',
              ),
              GButton(icon: Icons.account_balance_wallet, text: 'Wallet'),
              GButton(icon: Icons.help_outline, text: 'FAQs'),
              GButton(
                icon: Icons.account_circle,
                text: 'Profile',
              ),
            ]),
      ),
    );
  }
}

final List<Widget> screens = <Widget>[
  const DashboardPage(),
  const DepositsPage(),
  const WalletPage(),
  const FAQsPage(),
  const ProfilePage(),
];
