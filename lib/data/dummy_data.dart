import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DummyData {
  static final List<Map<String, dynamic>> projects = [
    {
      "title": "Technology behind the Blockchain",
      "subtitle": "Project #1 • See project details",
      "imageColor": Colors.redAccent,
    },
    {
      "title": "Technology behind the Blockchain",
      "subtitle": "Project #1 • See project details",
      "imageColor": Colors.blueAccent,
    },
    {
      "title": "Technology behind the Blockchain",
      "subtitle": "Project #1 • See project details",
      "imageColor": Colors.greenAccent,
    },
  ];

  static final List<Map<String, dynamic>> creators = [
    {
      "name": "@maddison_c21",
      "artworks": 9821,
      "ratingColor": Colors.purpleAccent,
      "ratingValue": 0.8,
    },
    {
      "name": "@karl.will02",
      "artworks": 7032,
      "ratingColor": Colors.blueAccent,
      "ratingValue": 0.6,
    },
    {
      "name": "@maddison_c21",
      "artworks": 9821,
      "ratingColor": Colors.purpleAccent,
      "ratingValue": 0.8,
    },
    {
      "name": "@maddison_c21",
      "artworks": 9821,
      "ratingColor": Colors.purpleAccent,
      "ratingValue": 0.8,
    },
  ];

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
