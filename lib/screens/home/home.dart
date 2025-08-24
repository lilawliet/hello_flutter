import 'package:flutter/material.dart';
import 'package:flutter_application/datas/home_banner_data.dart';
import 'package:flutter_application/datas/home_list_data.dart';
import 'package:flutter_application/routes/routes.dart';
import 'package:flutter_application/screens/home/view_model.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    // 初始化 Dio
    homeViewModel.initDio();
    // 获取 banner 数据
    homeViewModel.getBanner();
    // 获取 home 列表数据
    homeViewModel.getHomeList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeViewModel,
      child: Scaffold(
        body: SafeArea(
          // SingleChildScrollView 接管滚动事件，NeverScrollableScrollPhysics 禁止滚动
          child: SingleChildScrollView(
            child: Column(children: [_swiperView(), _ListView()]),
          ),
        ),
      ),
    );
  }

  Widget _swiperView() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        // homeviewmodel 的 bannerData 数据变化时，会通知到这个 builder 方法，重新构建 UI
        return SizedBox(
          width: double.infinity,
          height: 150.h,
          child: Swiper(
            itemCount: vm.bannerData?.length ?? 0,
            viewportFraction: 1.0,
            loop: true,
            autoplay: true,
            autoplayDelay: 3000,
            duration: 300,
            control: const SwiperControl(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: 150.h,
                child: Image.network(
                  vm.bannerData?[index].imagePath ?? '',
                  fit: BoxFit.cover,
                ),
              );
            },
            pagination: const SwiperPagination(),
          ),
        );
      },
    );
  }

  Widget _ListView() {
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _listItemView(vm.homeListData?[index]);
          },
          itemCount: vm.homeListData?.length ?? 0,
        );
      },
    );
  }

  Widget _listItemView(HomeListDatum? data) {
    // InkWell() // 点击的时候水波纹效果
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.webview,
          arguments: {'title': data?.title, 'url': data?.link},
        );
        // Navigator.push(context,
        // MaterialPageRoute(
        //   builder: (context) => WebView(
        //   title: '标题',
        //   url: 'https://www.baidu.com',
        // )));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5.r),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        // margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h, bottom: 1.h),
        // padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
        padding: EdgeInsets.only(
          top: 5.h,
          bottom: 5.h,
          left: 10.w,
          right: 10.w,
        ),

        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.network(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=600',
                    width: 28.r,
                    height: 28.r,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  data?.shareUser ?? '',
                  style: TextStyle(fontSize: 12.sp, color: Colors.black),
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Text(
                    data?.niceShareDate ?? '',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black),
                  ),
                ),
                // SizedBox(width: 5.w,),
                Text(
                  '置顶',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 5.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  data?.title ?? '',
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  data?.superChapterName ?? '',
                  style: TextStyle(fontSize: 12.sp, color: Colors.green),
                ),
                Expanded(child: SizedBox()),
                Image.asset(
                  'assets/images/star.png',
                  width: 20.r,
                  height: 20.r,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
