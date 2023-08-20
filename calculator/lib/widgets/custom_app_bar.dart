import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.leading,
      required this.titleWidget,
      required this.actionWidget});

  final Widget leading;
  final Widget titleWidget;
  final Widget actionWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: titleWidget,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leading,
                    Transform.translate(
                      offset: const Offset(10, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: actionWidget,
                      ),
                    )
                  ],
                )
              ],
            )));
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        80,
      );
}
