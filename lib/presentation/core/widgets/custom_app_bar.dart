// import 'package:flutter/material.dart';
// import 'package:octagon_africa/presentation/core/theme/text_theme.dart';
// // Project imports:

// /// [CustomAppBar] is a custom [AppBar] used for navigation and showing basic
// /// user controls
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   /// [CustomAppBar] is a custom [AppBar] used for navigation and showing basic
//   /// user controls
//   ///
//   const CustomAppBar({
//     Key? key,
//     this.title,
//     this.showLeadingIcon = true,
//   }) : super(key: key);

//   final String? title;

//   // whether to show the hamburger icon. defaults to
//   // true because most screens use it
//   final bool showLeadingIcon;

//   @override
//   Size get preferredSize => const Size.fromHeight(100.0);

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             blurRadius: 5,
//             spreadRadius: 1,
//             offset: const Offset(0.35, 0),
//             color: Colors.grey.withOpacity(0.2),
//           )
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 36.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             if (showLeadingIcon)
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.menu),
//               ),
//             Flexible(
//               child: Text(
//                 title ?? '',
//                 style: boldSize16Text(),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }
