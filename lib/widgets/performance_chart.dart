import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../data/dummy_data.dart';

class PerformanceChart extends StatefulWidget {
  const PerformanceChart({super.key});

  @override
  State<PerformanceChart> createState() => _PerformanceChartState();
}

class _PerformanceChartState extends State<PerformanceChart> {
  int? touchedSpotIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: title + legend side-by-side, wraps on narrow cards
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isNarrow = constraints.maxWidth < 380;
                final title = const Text(
                  'Over All Performance\nThe Years',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                );
                final legend = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLegendItem(Colors.purpleAccent, 'Pending Done'),
                    const SizedBox(width: 12),
                    _buildLegendItem(Colors.blueAccent, 'Project Done'),
                  ],
                );
                if (isNarrow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [title, const SizedBox(height: 8), legend],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: title),
                    const SizedBox(width: 8),
                    legend,
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned.fill(
                    // MouseRegion enables hover feedback on Flutter Web
                    child: MouseRegion(
                      onExit: (_) {
                        setState(() {
                          touchedSpotIndex = null;
                        });
                      },
                      child: LineChart(
                        LineChartData(
                          // ── Touch / Hover ─────────────────────────────
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: true,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              setState(() {
                                if (response == null ||
                                    response.lineBarSpots == null ||
                                    response.lineBarSpots!.isEmpty) {
                                  touchedSpotIndex = null;
                                } else {
                                  touchedSpotIndex =
                                      response.lineBarSpots!.first.spotIndex;
                                }
                              });
                            },
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipColor: (_) => const Color(0xFF2D1B69),
                              tooltipRoundedRadius: 8,
                              tooltipPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              getTooltipItems: (touchedSpots) {
                                return touchedSpots.map((spot) {
                                  final year =
                                      (2015 + spot.x.toInt()).toString();
                                  final label = spot.barIndex == 0
                                      ? 'Pending Done'
                                      : 'Project Done';
                                  return LineTooltipItem(
                                    '$year\n',
                                    const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 11,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '$label: ${spot.y.toInt()}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          // ── Grid ──────────────────────────────────────
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: Colors.grey.withOpacity(0.2),
                              strokeWidth: 1,
                            ),
                          ),
                          // ── Axes ──────────────────────────────────────
                          titlesData: FlTitlesData(
                            show: true,
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 10,
                                reservedSize: 28,
                                getTitlesWidget: (value, meta) => Text(
                                  value.toInt().toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  const years = [
                                    '2015',
                                    '2016',
                                    '2017',
                                    '2018',
                                    '2019',
                                    '2020'
                                  ];
                                  final i = value.toInt();
                                  if (i >= 0 && i < years.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        years[i],
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11,
                                        ),
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          minX: 0,
                          maxX: 5,
                          minY: 0,
                          maxY: 50,
                          // ── Lines ─────────────────────────────────────
                          lineBarsData: [
                            _buildLine(
                              spots: DummyData.pendingDoneData,
                              color: Colors.purpleAccent,
                              barIndex: 0,
                            ),
                            _buildLine(
                              spots: DummyData.projectDoneData,
                              color: Colors.blueAccent,
                              barIndex: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Static annotation tooltip (2023 badge)
                  Positioned(
                    top: 10,
                    left: 180,
                    child: IgnorePointer(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '2023',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '+55',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // ── Bottom Legend Row ──────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(Colors.purpleAccent, 'Pending Done'),
                const SizedBox(width: 24),
                _buildLegendItem(Colors.blueAccent, 'Project Done'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildLine({
    required List<FlSpot> spots,
    required Color color,
    required int barIndex,
  }) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      belowBarData: BarAreaData(show: false),
      // ── Interactive Dots ──────────────────────────────────────────────
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, bar, index) {
          final isTouched = index == touchedSpotIndex;
          return FlDotCirclePainter(
            radius: isTouched ? 7 : 4,
            color: isTouched ? Colors.white : (bar.color ?? color),
            strokeWidth: isTouched ? 3 : 0,
            strokeColor: bar.color ?? color,
          );
        },
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
