import 'package:flutter/material.dart';

class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final Color color;

  ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  ProjectModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    Color? color,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      color: color ?? this.color,
    );
  }
}
