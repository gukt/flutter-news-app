import 'package:get/get.dart';

import 'intl_en_us.dart';
import 'intl_zh_cn.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_CN': zhCN,
      };
}
