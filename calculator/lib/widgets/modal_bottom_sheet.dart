import 'package:calculator/styles.dart';
import 'package:calculator/widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
    required this.mainButtonCallback,
  });

  final Function() mainButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
            height: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Clear',
                        style: Styles().headingTextStyle.copyWith(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                      )),
                  Text(
                    'Do you want to clear history?',
                    style: Styles().regularTextStyle.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: RoundedButton(
                              title: 'Cancel',
                              style: Styles().regularTextStyle.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color),
                              onTap: () => Navigator.pop(context))),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: RoundedButton(
                            title: 'Clear',
                            style: Styles().regularTextStyle.copyWith(
                                color: Theme.of(context).colorScheme.tertiary),
                            onTap: () async {
                              await mainButtonCallback();
                            }),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ],
    );
  }
}
