import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/project_model.dart';

class EmployeeModel {
  final String name;
  final String handle;
  final int artworks;
  final Color ratingColor;
  final double ratingValue;

  EmployeeModel({
    required this.name,
    required this.handle,
    required this.artworks,
    required this.ratingColor,
    required this.ratingValue,
  });
}

final List<ProjectModel> dummyProjects = [
  ProjectModel(
    id: '1',
    title: 'Technology behind the Blockchain',
    subtitle: 'Project #1 • See project details',
    color: Colors.redAccent,
  ),
  ProjectModel(
    id: '2',
    title: 'AI-Powered Analytics Platform',
    subtitle: 'Project #2 • See project details',
    color: Colors.blueAccent,
  ),
  ProjectModel(
    id: '3',
    title: 'Mobile App Design System',
    subtitle: 'Project #3 • See project details',
    color: Colors.greenAccent,
  ),
  ProjectModel(
    id: '4',
    title: 'Cloud Infrastructure Migration',
    subtitle: 'Project #4 • See project details',
    color: Colors.orangeAccent,
  ),
  ProjectModel(
    id: '5',
    title: 'Real-time Collaboration Tool',
    subtitle: 'Project #5 • See project details',
    color: Colors.purpleAccent,
  ),
];

final List<EmployeeModel> dummyEmployees = [
  EmployeeModel(
    name: 'Maddison Clark',
    handle: '@maddison_c21',
    artworks: 9821,
    ratingColor: Colors.purpleAccent,
    ratingValue: 0.85,
  ),
  EmployeeModel(
    name: 'Karl Williams',
    handle: '@karl.will02',
    artworks: 7032,
    ratingColor: Colors.blueAccent,
    ratingValue: 0.62,
  ),
  EmployeeModel(
    name: 'Sophia Turner',
    handle: '@sophia_t',
    artworks: 8410,
    ratingColor: Colors.pinkAccent,
    ratingValue: 0.78,
  ),
  EmployeeModel(
    name: 'James Nguyen',
    handle: '@jnguyen',
    artworks: 5300,
    ratingColor: Colors.tealAccent,
    ratingValue: 0.50,
  ),
  EmployeeModel(
    name: 'Priya Sharma',
    handle: '@priya_sh',
    artworks: 6750,
    ratingColor: Colors.orangeAccent,
    ratingValue: 0.68,
  ),
  EmployeeModel(
    name: 'Lena Mueller',
    handle: '@lena.m',
    artworks: 9100,
    ratingColor: Colors.greenAccent,
    ratingValue: 0.91,
  ),
];

class DummyData {
  static final List<FlSpot> pendingDoneData = [
    const FlSpot(0, 20),
    const FlSpot(1, 15),
    const FlSpot(2, 25),
    const FlSpot(3, 30),
    const FlSpot(4, 45),
    const FlSpot(5, 40),
  ];

  static final List<FlSpot> projectDoneData = [
    const FlSpot(0, 10),
    const FlSpot(1, 25),
    const FlSpot(2, 15),
    const FlSpot(3, 40),
    const FlSpot(4, 30),
    const FlSpot(5, 50),
  ];
}
