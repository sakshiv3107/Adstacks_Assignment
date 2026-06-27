import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isNarrow = constraints.maxWidth < 400;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFF2D1B69), Color(0xFF11998E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: isNarrow ? _buildNarrowLayout() : _buildWideLayout(),
        );
      },
    );
  }

  Widget _buildWideLayout() {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          // Right Side Shapes
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 160,
            child: _buildShapes(),
          ),
          // Left Side Content
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 170, 16),
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildNarrowLayout() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 0,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'ETHEREUM 2.0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'Top Rating\nProject',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Trending project and high rating\nProject Created by team.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 11,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            foregroundColor: Colors.white,
            minimumSize: const Size(0, 28),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text('Learn More.', style: TextStyle(fontSize: 11)),
        ),
      ],
    );
  }

  Widget _buildShapes() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 16,
          left: 8,
          child: Transform.rotate(
            angle: -0.2,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        Positioned(
          top: 24,
          right: 24,
          child: Transform.rotate(
            angle: 0.4,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.tealAccent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 14,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.purpleAccent.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
