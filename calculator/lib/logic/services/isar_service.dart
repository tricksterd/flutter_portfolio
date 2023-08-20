import 'package:isar/isar.dart';
import 'package:calculator/collections/operation.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDb();
  }

  Future<void> saveOperation(Operation newOperation) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.operations.putSync(newOperation));
  }

  Future<List<Operation>> getAllOperations() async {
    final isar = await db;
    return await isar.operations.where().findAll();
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([OperationSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }
}
