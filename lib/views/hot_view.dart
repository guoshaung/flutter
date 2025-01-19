import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_service.dart';

class HotView extends StatefulWidget {
  const HotView({super.key});

  @override
  State<HotView> createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  final NewsService _newsService = NewsService();
  late Future<List<NewsModel>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = _newsService.getTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('热门'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _newsFuture = _newsService.getTopNews();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('获取新闻失败'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _newsFuture = _newsService.getTopNews();
                      });
                    },
                    child: const Text('重试'),
                  ),
                ],
              ),
            );
          }

          final news = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {
                _newsFuture = _newsService.getTopNews();
              });
            },
            child: ListView.separated(
              itemCount: news.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = news[index];
                return ListTile(
                  title: Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        item.source,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.publishTime,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  leading: item.imageUrl != null
                      ? Image.network(
                          item.imageUrl!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        )
                      : null,
                  onTap: () {
                    if (item.url != null) {
                      // 这里可以添加打开新闻详情的逻辑
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('正在打开: ${item.title}')),
                      );
                    }
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
