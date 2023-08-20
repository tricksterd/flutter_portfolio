import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged();
      },
      child: Container(
          width: 60.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(alignment: Alignment.center, children: [
            AnimatedPositioned(
                left: value ? 5 : 31,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.moon_fill,
                    size: 20,
                    color:
                        value ? Theme.of(context).colorScheme.tertiary : null),
                const SizedBox(width: 8.0),
                Icon(CupertinoIcons.sun_max_fill,
                    size: 20,
                    color:
                        !value ? Theme.of(context).colorScheme.tertiary : null),
              ],
            ),
          ])),
    );
  }
}
