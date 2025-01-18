import 'package:flutter/material.dart';
// import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import '../models/blog_model.dart';

class BlogCard extends StatelessWidget {
  final BlogModel blog;

  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(blog.authorAvatar),
                ),
                const SizedBox(width: 8),
                Text(
                  blog.authorName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(blog.content),
            if (blog.imageUrl != null) ...[
              const SizedBox(height: 8),
              Image.network(
                blog.imageUrl!,
                fit: BoxFit.cover,
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${blog.likes} 赞',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
