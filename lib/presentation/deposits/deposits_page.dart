import 'package:flutter/material.dart';
import 'package:octagon_africa/application/services/utils.dart';
import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
import 'package:octagon_africa/presentation/core/widgets/custom_app_bar.dart';
import 'package:octagon_africa/presentation/core/widgets/product_item.dart';
import 'package:octagon_africa/presentation/core/widgets/spaces.dart';

class DepositsPage extends StatelessWidget {
  const DepositsPage({Key? key}) : super(key: key);

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
            const ProductItem(title: 'Pension',),
            const ProductItem(title: 'Insurance',),
            const ProductItem(title: 'Trust',),
            const ProductItem(title: 'Training',),
            const ProductItem(title: 'Elections',),
          ],
        ),
      ),
    );
  }
}
