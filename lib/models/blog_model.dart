class BlogModel {
  final String id;
  final String authorName;
  final String authorAvatar;
  final String content;
  final String? imageUrl;
  final int likes;
  final DateTime createTime;

  BlogModel({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.content,
    this.imageUrl,
    required this.likes,
    required this.createTime,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      authorName: json['authorName'],
      authorAvatar: json['authorAvatar'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      likes: json['likes'],
      createTime: DateTime.parse(json['createTime']),
    );
  }
}
