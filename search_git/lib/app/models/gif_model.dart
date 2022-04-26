import 'dart:convert';

GifModel gifModelFromJson(String str) => GifModel.fromJson(json.decode(str));

String gifModelToJson(GifModel data) => json.encode(data.toJson());

class GifModel {
  GifModel({
    required this.images,
  });

  final Images images;

  factory GifModel.fromJson(Map<String, dynamic> json) => GifModel(
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
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
