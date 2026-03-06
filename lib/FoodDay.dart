import 'package:flutter/material.dart';


class FoodDay extends StatefulWidget {
  final int dayNumber;
  const FoodDay({super.key, required this.dayNumber});

  @override
  State<FoodDay> createState() => _FoodDayDetailState();
}

class _FoodDayDetailState extends State<FoodDay> {
  bool isCompleted = false;

  final List<Map<String, dynamic>> meals = [
    {
      'title': 'Bữa Sáng',
      'image': 'imgs/sang.jpg',
      'icon': Icons.wb_sunny_outlined,
      'color': const Color(0xFFFFF3E0),
      'iconColor': const Color(0xFFFF8F00),
      'items': ['1 tách trà hoặc cafe', 'cháo bột yến mạch'],
    },
    {
      'title': 'Bữa Trưa',
      'image': 'imgs/trua.jpg',
      'icon': Icons.lunch_dining,
      'color': const Color(0xFFE8F5E9),
      'iconColor': const Color(0xFF2E7D32),
      'items': ['cơm hoặc bánh mì', 'thịt gà hoặc lịch lợn'],
    },
    {
      'title': 'Bữa Tối',
      'image': 'imgs/toi.jpg',
      'icon': Icons.dinner_dining,
      'color': const Color(0xFFEDE7F6),
      'iconColor': const Color(0xFF6A1B9A),
      'items': ['bún chả hoặc phở', 'rau và hoa quả'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            width: 34, height: 34,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Ngày ${widget.dayNumber}',
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey[200]),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: const Text(
                'chế độ ăn tiêu chuẩn',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon bữa ăn
                      ClipOval(
                        child: Image.asset(
                          meal['image'] as String,
                          width: 52,
                          height: 52,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: meal['color'] as Color,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(meal['icon'] as IconData, color: meal['iconColor'] as Color, size: 26),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Nội dung
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal['title'] as String,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            ...(meal['items'] as List<String>).map(
                                  (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 14)),
                                    Expanded(child: Text(item, style: const TextStyle(fontSize: 14, color: Colors.black87))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Nút Hoàn Thành
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() => isCompleted = true);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ Hoàn thành ngày này!'),
                      backgroundColor: Colors.deepPurple,
                    ),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    if (mounted) Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCompleted ? Colors.green : Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
                child: Text(
                  isCompleted ? '✅ Đã Hoàn Thành' : 'Hoàn Thành',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}