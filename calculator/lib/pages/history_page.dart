import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator/collections/operation.dart';
import 'package:calculator/logic/providers/calculator_provider.dart';
import 'package:calculator/logic/providers/db_provider.dart';
import 'package:calculator/styles.dart';
import 'package:calculator/widgets/custom_app_bar.dart';
import 'package:calculator/widgets/history_item.dart';
import 'package:calculator/widgets/modal_bottom_sheet.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late List<Operation> operations;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = context.watch<DbProvider>();
    final calculatorProvider = context.read<CalculatorProvider>();
    return Scaffold(
      appBar: CustomAppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        titleWidget: Text('History',
            style: Styles().headingTextStyle.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                )),
        actionWidget: InkWell(
          child: const Icon(Icons.delete),
          onTap: () async {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ModalBottomSheet(
                      mainButtonCallback: () async {
                        Navigator.pop(context);
                        await dbProvider.deleteAllOperations();
                      },
                    ));
          },
        ),
      ),
      body: FutureBuilder(
          future: dbProvider.getAllOperations(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return dbProvider.operations.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ListView.builder(
                          itemCount: dbProvider.operations.length,
                          itemBuilder: ((context, index) {
                            return HistoryItem(
                              question: dbProvider.operations[index].question,
                              result: dbProvider.operations[index].result,
                              onTap: (String value) {
                                calculatorProvider.addEquationToQuestion(value);
                                Navigator.pop(context);
                              },
                            );
                          })),
                    )
                  : Center(
                      child: Text('Your history is empty...',
                          style: Styles().regularTextStyle.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color)));
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ));
            }
          }),
    );
  }
}
