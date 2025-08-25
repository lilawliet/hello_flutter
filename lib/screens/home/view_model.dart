import 'package:flutter/material.dart';
import 'package:flutter_application/repository/api.dart';
import 'package:flutter_application/repository/datas/home_banner_data.dart';
import 'package:flutter_application/repository/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeBannerDatum>? bannerData;
  List<HomeListDatum>? homeListData;

  Future getHomeList() async {
    List<HomeListDatum> homeListData = await Api.instance.getHomeList();

    print(homeListData);
    if (homeListData.isNotEmpty) {
      this.homeListData = homeListData;
    } else {
      this.homeListData = [];
    }

    notifyListeners();
  }

  Future getBanner() async {
    List<HomeBannerDatum> homeBannerData = await Api.instance.getBanner();
    if (homeBannerData.isNotEmpty) {
      bannerData = homeBannerData;
    } else {
      bannerData = [];
    }
    notifyListeners();
  }
}
