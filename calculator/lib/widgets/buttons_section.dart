import 'package:calculator/logic/providers/calculator_provider.dart';
import 'package:calculator/styles.dart';
import 'package:calculator/widgets/buttons/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = context.read<CalculatorProvider>();
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 12),
      itemCount: calculatorProvider.buttons.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: MediaQuery.of(context).size.width / 16),
      itemBuilder: (BuildContext context, int index) {
        if (index == calculatorProvider.buttons.length - 1) {
          return CalculatorButton(
            text: calculatorProvider.buttons[index].text,
            icon: Icon(
              calculatorProvider.buttons[index].iconData,
              color: Colors.white,
              size: 28,
            ),
            onTapCallback: () {
              calculatorProvider.focusOnResult();
            },
            color: Theme.of(context).colorScheme.tertiary,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          );
        }
        return CalculatorButton(
            text: calculatorProvider.buttons[index].text,
            icon: calculatorProvider.buttons[index].iconData != null
                ? Icon(calculatorProvider.buttons[index].iconData,
                    color: Theme.of(context).colorScheme.tertiary, size: 28)
                : null,
            onTapCallback: () {
              calculatorProvider.returnCallBack(index);
            },
            color: Theme.of(context).colorScheme.secondary,
            textStyle: Styles().regularTextStyleForEquation.copyWith(
                color: calculatorProvider.buttons[index].text == 'AC'
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).textTheme.bodyLarge!.color));
      },
    );
  }
}
