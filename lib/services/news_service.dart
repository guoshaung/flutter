import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/news_model.dart';

class NewsService {
  static const String _apiKey = '你的API密钥'; // 需要替换为实际的API密钥
  static const String _baseUrl = 'https://api.toutiao.com/api/news/feed';

  Future<List<NewsModel>> getTopNews() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?key=$_apiKey&type=top'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> newsItems = data['data'];
        return newsItems.map((item) => NewsModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
