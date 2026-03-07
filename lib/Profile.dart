import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Cài Đặt', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 64, height: 64,
                    decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                    child: const Icon(Icons.person, color: Colors.white, size: 36),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Người dùng', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Chỉnh sửa hồ sơ', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(leading: const Icon(Icons.notifications), title: const Text('Thông báo'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
                  const Divider(height: 1, indent: 56),
                  ListTile(leading: const Icon(Icons.language), title: const Text('Ngôn ngữ'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
                  const Divider(height: 1, indent: 56),
                  ListTile(leading: const Icon(Icons.dark_mode), title: const Text('Giao diện tối'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(leading: const Icon(Icons.help_outline), title: const Text('Trợ giúp'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
                  const Divider(height: 1, indent: 56),
                  ListTile(leading: const Icon(Icons.info_outline), title: const Text('Về ứng dụng'), trailing: const Icon(Icons.chevron_right), onTap: () {}),
                  const Divider(height: 1, indent: 56),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text('Đăng xuất', style: TextStyle(color: Colors.red)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}