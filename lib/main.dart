import 'package:flutter/material.dart';
import 'views/hot_view.dart';
import 'views/message_view.dart';
import 'views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '社交应用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const SearchHomePage(),
    const HotView(),
    const MessageView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: '热门',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我',
          ),
        ],
      ),
    );
  }
}

class SearchHomePage extends StatelessWidget {
  const SearchHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '不太智能的拍照搜题',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '输入搜索内容',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // 实现拍照功能
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // 实现搜索功能
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureItem(Icons.smart_toy, 'AI助手'),
              _buildFeatureItem(Icons.edit_note, '笔记搜索'),
              _buildFeatureItem(Icons.mail, '邮件'),
              _buildFeatureItem(Icons.cloud, '云盘'),
              _buildFeatureItem(Icons.medical_services, '医疗'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
