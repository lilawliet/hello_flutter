// To parse this JSON data, do
//
//     final homeListData = homeListDataFromJson(jsonString);

import 'dart:convert';

HomeListData homeListDataFromJson(String str) =>
    HomeListData.fromJson(json.decode(str));

String homeListDataToJson(HomeListData data) => json.encode(data.toJson());

class HomeListData {
  int? curPage;
  List<HomeListDatum>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  HomeListData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory HomeListData.fromJson(Map<String, dynamic> json) => HomeListData(
    curPage: json["curPage"],
    datas: json["datas"] == null
        ? []
        : List<HomeListDatum>.from(
            json["datas"]!.map((x) => HomeListDatum.fromJson(x)),
          ),
    offset: json["offset"],
    over: json["over"],
    pageCount: json["pageCount"],
    size: json["size"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "curPage": curPage,
    "datas": datas == null
        ? []
        : List<dynamic>.from(datas!.map((x) => x.toJson())),
    "offset": offset,
    "over": over,
    "pageCount": pageCount,
    "size": size,
    "total": total,
  };
}

class HomeListDatum {
  bool? adminAdd;
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<Tag>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  HomeListDatum({
    this.adminAdd,
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.isAdminAdd,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory HomeListDatum.fromJson(Map<String, dynamic> json) => HomeListDatum(
    adminAdd: json["adminAdd"],
    apkLink: json["apkLink"],
    audit: json["audit"],
    author: json["author"],
    canEdit: json["canEdit"],
    chapterId: json["chapterId"],
    chapterName: json["chapterName"],
    collect: json["collect"],
    courseId: json["courseId"],
    desc: json["desc"],
    descMd: json["descMd"],
    envelopePic: json["envelopePic"],
    fresh: json["fresh"],
    host: json["host"],
    id: json["id"],
    isAdminAdd: json["isAdminAdd"],
    link: json["link"],
    niceDate: json["niceDate"],
    niceShareDate: json["niceShareDate"],
    origin: json["origin"],
    prefix: json["prefix"],
    projectLink: json["projectLink"],
    publishTime: json["publishTime"],
    realSuperChapterId: json["realSuperChapterId"],
    selfVisible: json["selfVisible"],
    shareDate: json["shareDate"],
    shareUser: json["shareUser"],
    superChapterId: json["superChapterId"],
    superChapterName: json["superChapterName"],
    tags: json["tags"] == null
        ? []
        : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    title: json["title"],
    type: json["type"],
    userId: json["userId"],
    visible: json["visible"],
    zan: json["zan"],
  );

  Map<String, dynamic> toJson() => {
    "adminAdd": adminAdd,
    "apkLink": apkLink,
    "audit": audit,
    "author": author,
    "canEdit": canEdit,
    "chapterId": chapterId,
    "chapterName": chapterName,
    "collect": collect,
    "courseId": courseId,
    "desc": desc,
    "descMd": descMd,
    "envelopePic": envelopePic,
    "fresh": fresh,
    "host": host,
    "id": id,
    "isAdminAdd": isAdminAdd,
    "link": link,
    "niceDate": niceDate,
    "niceShareDate": niceShareDate,
    "origin": origin,
    "prefix": prefix,
    "projectLink": projectLink,
    "publishTime": publishTime,
    "realSuperChapterId": realSuperChapterId,
    "selfVisible": selfVisible,
    "shareDate": shareDate,
    "shareUser": shareUser,
    "superChapterId": superChapterId,
    "superChapterName": superChapterName,
    "tags": tags == null
        ? []
        : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "title": title,
    "type": type,
    "userId": userId,
    "visible": visible,
    "zan": zan,
  };
}

class Tag {
  String? name;
  String? url;

  Tag({this.name, this.url});

  factory Tag.fromJson(Map<String, dynamic> json) =>
      Tag(name: json["name"], url: json["url"]);

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
