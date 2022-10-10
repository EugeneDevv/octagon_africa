import 'package:flutter/material.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/theme/theme.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key, required this.name, required this.icon, this.onTap})
      : super(key: key);

  final String name;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Row(children: <Widget>[
          Icon(
            icon,
            size: 20.0,
            color: AppColors.whiteColor,
          ),
          largeHorizontalSizedBox,
          Text(
            name,
            style: boldSize18Text(AppColors.whiteColor),
          ),
        ]),
      ),
    );
  }
}
