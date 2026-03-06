import 'package:flutter/material.dart';
import 'Anhbia.dart';
import 'TrainingDay.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class Training extends StatelessWidget {
  final Map<String, dynamic> program;
  const Training({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    final int totalDays = (program['sessions'] as int);
    final int completedDays = 3; // có thể truyền vào sau

    final days = List.generate(totalDays, (i) => {
      'day': i + 1,
      'duration': '13 phút',
      'done': i < completedDays,
      'current': i == completedDays, 
    });

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
          program['title'] as String,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(height: 2, color: Colors.deepPurple),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh bìa chương trình
          Container(
            width: double.infinity,
            height: 200,
            child: program.containsKey('image')
                ? Image.asset(program['image'] as String, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Anhbia(program: program))
                : Anhbia(program: program),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$completedDays/$totalDays ngày',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: totalDays,
              itemBuilder: (context, index) {
                final day = days[index];
                final bool isCurrent = day['current'] as bool;
                final bool isDone = day['done'] as bool;

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DayDetailPage(
                        program: program,
                        dayNumber: index + 1,
                      ),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: isCurrent ? const Color(0xFFE53935) : const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ngày ${index + 1}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              day['duration'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}