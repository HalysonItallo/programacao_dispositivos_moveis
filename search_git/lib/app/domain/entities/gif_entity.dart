import 'dart:convert';

GifEntity gifEntityFromJson(String str) => GifEntity.fromJson(json.decode(str));

String gifEntityToJson(GifEntity data) => json.encode(data.toJson());

class GifEntity {
  GifEntity({
    required this.title,
    required this.images,
  });

  final String title;
  final Images images;

  factory GifEntity.fromJson(Map<String, dynamic> json) => GifEntity(
        title: json["title"],
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "images": images.toJson(),
      };
}

class Images {
  Images({
    required this.fixedHeight,
  });

  final FixedHeight fixedHeight;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        fixedHeight: FixedHeight.fromJson(json["fixed_height"]),
      );

  Map<String, dynamic> toJson() => {
        "fixed_height": fixedHeight.toJson(),
      };
}

class FixedHeight {
  FixedHeight({
    required this.url,
  });

  final String url;

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
