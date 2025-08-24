import 'home_banner_data.dart';

class HomeBannerExample {
  // 示例：处理可能缺失的字段
  void processBannerData(HomeBannerData bannerData) {
    // 安全地访问可能为空的字段
    if (bannerData.data != null && bannerData.data!.isNotEmpty) {
      print('有 ${bannerData.data!.length} 个banner数据');

      for (var banner in bannerData.data!) {
        // 使用 ?. 操作符安全访问字段
        print('标题: ${banner.title ?? "无标题"}');
        print('描述: ${banner.desc ?? "无描述"}');
        print('图片: ${banner.imagePath ?? "无图片"}');
        print('链接: ${banner.url ?? "无链接"}');

        // 使用 ?? 操作符提供默认值
        final isVisible = banner.isVisible ?? 0;
        final order = banner.order ?? 999;
        final type = banner.type ?? -1;

        print('是否可见: $isVisible');
        print('排序: $order');
        print('类型: $type');
        print('---');
      }
    } else {
      print('没有banner数据');
    }

    // 检查错误信息
    if (bannerData.errorCode != null && bannerData.errorCode != 0) {
      print('错误代码: ${bannerData.errorCode}');
      print('错误信息: ${bannerData.errorMsg ?? "未知错误"}');
    }
  }

  // 示例：创建部分数据
  HomeBannerDatum createPartialBanner() {
    return HomeBannerDatum(
      title: '部分数据',
      url: 'https://example.com',
      // 其他字段为null，表示缺失
    );
  }

  // 示例：安全地构建URL
  String? buildSafeUrl(HomeBannerDatum banner) {
    // 只有当url不为空且不为空字符串时才返回
    if (banner.url != null && banner.url!.isNotEmpty) {
      return banner.url;
    }
    return null;
  }

  // 示例：条件显示
  String getDisplayTitle(HomeBannerDatum banner) {
    // 优先使用title，如果没有则使用desc，都没有则显示默认值
    return banner.title ?? banner.desc ?? '默认标题';
  }

  // 示例：数值计算
  int calculatePriority(HomeBannerDatum banner) {
    // 使用 ?? 操作符提供默认值进行计算
    final order = (banner.order ?? 0).toInt();
    final isVisible = (banner.isVisible ?? 0).toInt();

    // 如果可见且有序号，返回优先级
    if (isVisible == 1 && order > 0) {
      return order;
    }

    // 否则返回低优先级
    return 999;
  }
}

// 使用示例
void main() {
  final example = HomeBannerExample();

  // 模拟部分数据
  final partialBanner = example.createPartialBanner();

  print('标题: ${example.getDisplayTitle(partialBanner)}');
  print('优先级: ${example.calculatePriority(partialBanner)}');
  print('安全URL: ${example.buildSafeUrl(partialBanner)}');
}
