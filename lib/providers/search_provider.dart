import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../data/dummy_data.dart';

class SearchProvider extends ChangeNotifier {
  String _query = '';

  String get query => _query;

  bool get hasQuery => _query.isNotEmpty;

  void updateQuery(String value) {
    _query = value.toLowerCase().trim();
    notifyListeners();
  }

  void clearQuery() {
    _query = '';
    notifyListeners();
  }

  List<ProjectModel> filteredProjects(List<ProjectModel> all) {
    if (_query.isEmpty) return all;
    return all
        .where((p) => p.title.toLowerCase().contains(_query))
        .toList();
  }

  List<EmployeeModel> filteredEmployees(List<EmployeeModel> all) {
    if (_query.isEmpty) return all;
    return all
        .where((e) =>
            e.name.toLowerCase().contains(_query) ||
            e.handle.toLowerCase().contains(_query))
        .toList();
  }
}
