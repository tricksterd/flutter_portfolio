import 'package:isar/isar.dart';

part 'operation.g.dart';

@collection
class Operation {
  Id id = Isar.autoIncrement;

  late String question;

  late String result;
}
