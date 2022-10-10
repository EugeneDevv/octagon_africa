import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:octagon_africa/application/redux/states/app_state.dart';
import 'package:octagon_africa/application/redux/view_models/bottom_nav_view_model.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/bottom_nav.dart';
import 'package:octagon_africa/presentation/core/widgets/navigation_drawer/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomNavViewModel>(
      converter: (Store<AppState> store) => BottomNavViewModel.fromStore(store),
      builder: (BuildContext context, BottomNavViewModel vm) {
        return Scaffold(
          appBar: vm.barTitle.isEmpty
              ? null
              : AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    vm.barTitle,
                    style: boldSize16Text(AppColors.blackColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          drawer: const NavigationDrawer(),
          body: SafeArea(
            child: IndexedStack(
              index: vm.currentIndex,
              children: screens,
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: vm.currentIndex,
          ),
        );
      },
    );
  }
}
