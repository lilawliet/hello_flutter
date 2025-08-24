import 'package:dio/dio.dart';
import 'package:flutter_application/datas/home_banner_data.dart';

class HomeViewModel {
  static Future<List<HomeBannerDatum>?> getBanner() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
      method: 'GET',
      baseUrl: 'https://www.wanandroid.com/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 30),
    );

    Response response = await dio.get('banner/json');

    print(response.data);

    HomeBannerData homeBannerData = HomeBannerData.fromJson(response.data);

    if (homeBannerData.data != null && homeBannerData.data!.isNotEmpty) {
      return homeBannerData.data;
    }

    return [];

    // var response = await dio.get('/banner/json');
    // return response.data;

    // var response = await Dio().get('https://www.baidu.com/s?wd=flutter');
    // return response.data;
  }
}
