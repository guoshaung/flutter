import 'package:flutter/material.dart';
import '../models/blog_model.dart';
import '../widgets/blog_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // 模拟数据
    final List<BlogModel> blogs = [
      BlogModel(
        id: '1',
        authorName: 'Aliyah Castro',
        authorAvatar: 'https://example.com/avatar1.jpg',
        content: '我在#Chinese with Fan的笔记下发布了一条评论',
        imageUrl: 'https://example.com/blog1.jpg',
        likes: 1,
        createTime: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return BlogCard(blog: blogs[index]);
        },
      ),
    );
  }
}
