// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      title: json['title'] as String,
      source: json['source'] as String,
      publishTime: json['publish_time'] as String,
      imageUrl: json['imageUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'title': instance.title,
      'source': instance.source,
      'publish_time': instance.publishTime,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
    };
