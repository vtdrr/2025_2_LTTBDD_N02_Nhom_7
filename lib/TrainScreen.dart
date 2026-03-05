import 'package:flutter/material.dart';
import 'Training.dart';
import 'Anhbia.dart';


class TrainScreen extends StatelessWidget {
  const TrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final programs = [
      {

        'title': 'Muay Thai cơ bản',
        'rating': 3.0,
        'image': 'imgs/1.jpeg',
        'color1': const Color(0xFF1a1a2e),
        'color2': const Color(0xFF16213e),
        'level': 'Cơ bản',
        'duration': '4 tuần',
        'sessions': 12,
      },
      {
        'title': 'Muay Thai nâng cao',
        'rating': 4.0,
        'image': 'imgs/2.webp',
        'color1': const Color(0xFF2d1b00),
        'color2': const Color(0xFF8B4513),
        'level': 'Nâng cao',
        'duration': '8 tuần',
        'sessions': 24,
      },
      {
        'title': 'Muay Thai bán chuyên',
        'rating': 5.0,
        'image': 'imgs/3.webp',
        'color1': const Color(0xFF0d2137),
        'color2': const Color(0xFF1565C0),
        'level': 'Nâng cao',
        'duration': '6 tuần',
        'sessions': 18,
      },
      {
        'title': 'Muay Thai chuyên nghiệp',
        'rating': 5.0,
        'image': 'imgs/4.jpg',
        'color1': const Color(0xFF0d2137),
        'color2': const Color(0xFF1565C0),
        'level': 'Siêu nâng cao',
        'duration': '6 tuần',
        'sessions': 18,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Trang chủ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 36,
            height: 36,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weekly Stats Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Tuần này',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _StatItem(icon: Icons.fitness_center, value: '0', label: 'lần tập'),
                      _StatItem(icon: Icons.timer, value: '0', label: 'phút'),
                      _StatItem(icon: Icons.local_fire_department, value: '0', label: 'calo'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Chương Trình',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 12),
            ...programs.map((program) => _ProgramCard(program: program)).toList(),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const _StatItem({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final Map<String, dynamic> program;
  const _ProgramCard({required this.program});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Training(program: program)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      program['image'] as String,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
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
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12, right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        program['level'] as String,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(program['title'] as String, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Row(children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text((program['rating'] as double).toString(),
                        style: const TextStyle(fontSize: 13, color: Colors.amber, fontWeight: FontWeight.w600)),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}