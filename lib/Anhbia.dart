import 'package:flutter/material.dart';

class Anhbia extends StatelessWidget {
  final Map<String, dynamic> program;
  const Anhbia({required this.program});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [program['color1'] as Color, program['color2'] as Color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(Icons.sports_martial_arts, size: 80, color: Colors.white30),
      ),
    );
  }
}