import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/datas/home_banner_data.dart';
import 'package:flutter_application/datas/home_list_data.dart';
import 'package:flutter_application/https/dio_instance.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerDatum>? bannerData;
  List<HomeListDatum>? homeListData;

  Future getHomeList() async {
    print('getHomeList');
    Response response = await DioInstance.getInstance().get(
      'article/list/0/json',
    );

    HomeListData homeListData = HomeListData.fromJson(response.data);

    print(homeListData.datas);
    if (homeListData.datas != null && homeListData.datas!.isNotEmpty) {
      this.homeListData = homeListData.datas;
    } else {
      this.homeListData = [];
    }

    notifyListeners();
  }

  Future getBanner() async {
    Response response = await DioInstance.getInstance().get('banner/json');

    print(response.data);

    // 由于拦截器已经处理了数据，response.data 已经是解析后的数据
    // 我们需要直接使用 fromJson 方法而不是 homeBannerDataFromJson
    List<HomeBannerDatum> homeBannerData = (response.data as List)
        .map((item) => HomeBannerDatum.fromJson(item))
        .toList();

    if (homeBannerData.isNotEmpty) {
      bannerData = homeBannerData;
    } else {
      bannerData = [];
    }
    notifyListeners();
  }
}
