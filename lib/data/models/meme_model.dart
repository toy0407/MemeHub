import 'dart:convert';

import '../../domain/entities/meme.dart';

class MemeModel extends Meme {
  MemeModel({
    super.title,
    super.url,
    super.nsfw,
    super.spoiler,
    super.author,
    super.upvotes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
      'nsfw': nsfw,
      'spoiler': spoiler,
      'author': author,
      'upvotes': upvotes,
    };
  }

  factory MemeModel.fromJson(Map<String, dynamic> json) {
    return MemeModel(
      title: json['title'] != null ? json['title'] as String : null,
      url: json['url'] != null ? json['url'] as String : null,
      nsfw: json['nsfw'] != null ? json['nsfw'] as bool : null,
      spoiler: json['spoiler'] != null ? json['spoiler'] as bool : null,
      author: json['author'] != null ? json['author'] as String : null,
      upvotes: json['upvotes'] != null ? json['upvotes'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());
}
