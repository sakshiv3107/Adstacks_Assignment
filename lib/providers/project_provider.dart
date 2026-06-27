import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../data/dummy_data.dart';

class ProjectProvider extends ChangeNotifier {
  final List<ProjectModel> _projects = [...dummyProjects];

  List<ProjectModel> get projects => List.unmodifiable(_projects);

  void addProject(String title, String subtitle, Color color) {
    _projects.add(ProjectModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      subtitle: subtitle,
      color: color,
    ));
    notifyListeners();
  }

  void editProject(String id, String title, String subtitle, Color color) {
    final index = _projects.indexWhere((p) => p.id == id);
    if (index != -1) {
      _projects[index] = _projects[index].copyWith(
        title: title,
        subtitle: subtitle,
        color: color,
      );
      notifyListeners();
    }
  }

  void deleteProject(String id) {
    _projects.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
