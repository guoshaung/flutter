import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String title;
  final String source;
  @JsonKey(name: 'publish_time')
  final String publishTime;
  final String? imageUrl;
  final String? url;

  NewsModel({
    required this.title,
    required this.source,
    required this.publishTime,
    this.imageUrl,
    this.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
