import 'package:get/get.dart';

import 'intl_en_us.dart';
import 'intl_zh_cn.dart';

class AppTranslations extends Translations {
  AppTranslations._();

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en_US': enUS,
      'zh-CN': zhCN,
    };
  }
}
