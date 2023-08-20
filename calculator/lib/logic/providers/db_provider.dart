// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calculator/collections/operation.dart';
import 'package:calculator/logic/services/isar_service.dart';
import 'package:flutter/material.dart';

enum LoadingState { loading, ready }

class DbProvider extends ChangeNotifier {
  late IsarService _isarService;

  late List<Operation> operations;
  late LoadingState loadingState;
  DbProvider() {
    _isarService = IsarService();
    operations = [];
  }

  Future<List<Operation>> getAllOperations() async {
    operations = await _isarService.getAllOperations();
    return operations;
  }

  bool isLoadingState() {
    return loadingState == LoadingState.loading;
  }

  Future<void> deleteAllOperations() async {
    operations.clear();
    await _isarService.cleanDb();
    notifyListeners();
  }

  void saveOperation(Operation operation) {
    _isarService.saveOperation(operation);
    notifyListeners();
  }
}
