// To parse this JSON data, do
//
//     final homeBannerData = homeBannerDataFromJson(jsonString);

import 'dart:convert';

List<HomeBannerDatum> homeBannerDataFromJson(String str) =>
    List<HomeBannerDatum>.from(
      json.decode(str).map((x) => HomeBannerDatum.fromJson(x)),
    );

String homeBannerDataToJson(List<HomeBannerDatum> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeBannerDatum {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  HomeBannerDatum({
    required this.desc,
    required this.id,
    required this.imagePath,
    required this.isVisible,
    required this.order,
    required this.title,
    required this.type,
    required this.url,
  });

  factory HomeBannerDatum.fromJson(Map<String, dynamic> json) =>
      HomeBannerDatum(
        desc: json["desc"],
        id: json["id"],
        imagePath: json["imagePath"],
        isVisible: json["isVisible"],
        order: json["order"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
    "desc": desc,
    "id": id,
    "imagePath": imagePath,
    "isVisible": isVisible,
    "order": order,
    "title": title,
    "type": type,
    "url": url,
  };
}
