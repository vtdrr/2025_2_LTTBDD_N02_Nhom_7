import 'package:flutter/material.dart';
import 'Anhbia.dart';
import 'Start.dart';

class DayDetailPage extends StatelessWidget {
  final Map<String, dynamic> program;
  final int dayNumber;

  const DayDetailPage({super.key, required this.program, required this.dayNumber});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {'name': 'Khởi Động',    'duration': '00:30'},
      {'name': 'Nhảy Dây',     'duration': '01:30'},
      {'name': 'Dãn cơ tay',   'duration': '00:30'},
      {'name': 'Dãn cơ chân',  'duration': '00:30'},
      {'name': 'Đấm thẳng (Jab)',   'duration': '02:00'},
      {'name': 'Đấm móc (Hook)',    'duration': '02:00'},
      {'name': 'Đá tròn (Roundhouse)', 'duration': '02:00'},
      {'name': 'Phòng thủ cơ bản', 'duration': '01:30'},
      {'name': 'Bài tập thể lực',  'duration': '03:00'},
      {'name': 'Thả lỏng',         'duration': '01:00'},
    ];

    final int totalExercises = exercises.length;
    final String totalTime = '13:00';
    final int totalCalo = 120;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Ngày $dayNumber',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 2, color: Colors.deepPurple),
        ),
      ),
      body: Column(
        children: [
          // Ảnh bìa
          SizedBox(
            width: double.infinity,
            height: 200,
            child: program.containsKey('image')
                ? Image.asset(program['image'] as String, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Anhbia(program: program))
                : Anhbia(program: program),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _DayStat(value: '$totalExercises', label: 'Bài tập'),
                _DayStat(value: totalTime, label: 'Thời gian'),
                _DayStat(value: '$totalCalo', label: 'Calo'),
              ],
            ),
          ),

          const Divider(height: 1),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final ex = exercises[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.play_arrow, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ex['name']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                            const SizedBox(height: 2),
                            Text(ex['duration']!, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Start()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5353),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Bắt Đầu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DayStat extends StatelessWidget {
  final String value;
  final String label;
  const _DayStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }
}