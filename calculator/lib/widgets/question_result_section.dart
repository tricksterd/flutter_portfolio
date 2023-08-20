import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator/logic/providers/calculator_provider.dart';
import 'package:calculator/styles.dart';
import 'package:calculator/widgets/question_result_text_row.dart';

class QuestionResultSection extends StatelessWidget {
  const QuestionResultSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final calculatorProvider = context.watch<CalculatorProvider>();
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //todo: somehow avoid overflowing
          if (calculatorProvider.questionState == QuestionState.shown)
            QuestionResultTextRow(
                onTap: () => calculatorProvider.focusOnQuestion(),
                textStyle: textStyleForQuestionResultRows(context,
                    condition: calculatorProvider.focusOn == FocusOn.question,
                    isItQuestion: true),
                child: Text(
                  calculatorProvider.question,
                  softWrap: true,
                )),
          QuestionResultTextRow(
            onTap: () => calculatorProvider.focusOnResult(),
            textStyle: textStyleForQuestionResultRows(context,
                condition: calculatorProvider.focusOn == FocusOn.result),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (calculatorProvider.questionState == QuestionState.shown)
                  const Text(
                    '=',
                  ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  calculatorProvider.result,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

TextStyle textStyleForQuestionResultRows(BuildContext context,
    {required bool condition, bool isItQuestion = false}) {
  Color? color = isItQuestion
      ? Theme.of(context).textTheme.bodyLarge!.color
      : condition
          ? Theme.of(context).textTheme.bodyLarge!.color
          : Theme.of(context).colorScheme.secondary;
  return condition
      ? Styles().activeTextStyle.copyWith(color: color)
      : Styles().regularTextStyleForEquation.copyWith(color: color);
}
