// To parse this JSON data, do
//
//     final homeBannerData = homeBannerDataFromJson(jsonString);

import 'dart:convert';

HomeBannerData homeBannerDataFromJson(String str) =>
    HomeBannerData.fromJson(json.decode(str));

String homeBannerDataToJson(HomeBannerData data) => json.encode(data.toJson());

class HomeBannerData {
  final List<HomeBannerDatum>? data;
  final num? errorCode;
  final String? errorMsg;

  HomeBannerData({this.data, this.errorCode, this.errorMsg});

  factory HomeBannerData.fromJson(Map<String, dynamic> json) => HomeBannerData(
    data: json["data"] != null
        ? List<HomeBannerDatum>.from(
            (json["data"] as List<dynamic>).map(
              (x) => HomeBannerDatum.fromJson(x),
            ),
          )
        : null,
    errorCode: json["errorCode"],
    errorMsg: json["errorMsg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.map((x) => x.toJson()).toList(),
    "errorCode": errorCode,
    "errorMsg": errorMsg,
  };
}

class HomeBannerDatum {
  final String? desc;
  final num? id;
  final String? imagePath;
  final num? isVisible;
  final num? order;
  final String? title;
  final num? type;
  final String? url;

  HomeBannerDatum({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
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
