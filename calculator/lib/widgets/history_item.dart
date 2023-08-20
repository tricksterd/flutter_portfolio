import 'package:calculator/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem(
      {super.key,
      required this.question,
      required this.result,
      required this.onTap});

  final String question;
  final String result;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                onTap(question);
              },
              child: Text(question,
                  style: Styles().regularTextStyleForEquation.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color))),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              onTap(result);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(CupertinoIcons.equal,
                    size: 20,
                    color: Theme.of(context).textTheme.bodyLarge!.color),
                const SizedBox(
                  width: 5,
                ),
                Text(result,
                    style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).textTheme.bodyLarge!.color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
