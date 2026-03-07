import 'package:flutter/material.dart';
import 'dart:async';
import 'Start_2.dart';


class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int _seconds = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Hàm xử lý logic đếm ngược
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _timer?.cancel();
        _navigateToNextPage();
      }
    });
  }

  void _navigateToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Start_2()));
    print("Hết thời gian khởi động! Chuyển sang bài tập chính.");
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'imgs/6.jpeg',
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),
          const Text(
              "Chuẩn Bị",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          ),
          const Text(
              "Khởi Động",
              style: TextStyle(fontSize: 20, color: Colors.grey)
          ),

          const Spacer(),

          Text(
            "00:${_seconds.toString().padLeft(2, '0')}",
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  _timer?.cancel();
                  _navigateToNextPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Tiếp Tục",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
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