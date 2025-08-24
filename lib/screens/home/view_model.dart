import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/datas/home_banner_data.dart';
import 'package:flutter_application/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerDatum>? bannerData;
  List<HomeListDatum>? homeListData;
  Dio dio = Dio();

  void initDio() {
    dio.options = BaseOptions(
      method: 'GET',
      baseUrl: 'https://www.wanandroid.com/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 30),
    );
  }

  Future getHomeList() async {
    Response response = await dio.get('article/list/0/json');

    HomeListData homeListData = HomeListData.fromJson(response.data);

    print(homeListData.data!.datas);
    if (homeListData.data != null &&
        homeListData.data!.datas != null &&
        homeListData.data!.datas!.isNotEmpty) {
      this.homeListData = homeListData.data!.datas;
    } else {
      this.homeListData = [];
    }

    notifyListeners();
  }

  Future getBanner() async {
    Response response = await dio.get('banner/json');

    print(response.data);

    HomeBannerData homeBannerData = HomeBannerData.fromJson(response.data);

    if (homeBannerData.data != null && homeBannerData.data!.isNotEmpty) {
      bannerData = homeBannerData.data;
    } else {
      bannerData = [];
    }
    notifyListeners();
  }
}
