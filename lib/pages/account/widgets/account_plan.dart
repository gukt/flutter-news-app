import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';
import 'package:flutter_news_app/pages/account/account_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 账户付费计划组件
class AccountPlanCard extends StatelessWidget {
  const AccountPlanCard({
    Key? key,
    required this.period,
    required this.price,
    required this.info,
    this.id = 0,
    this.active = false,
  }) : super(key: key);

  final String period;
  final String price;
  final String info;
  final int id;
  final bool active;

  @override
  Widget build(BuildContext context) {
    debugPrint('building  _AccountPlanState');
    final AccountController controller = Get.put(AccountController());
    return Obx(
      () {
        Color? outlineColor = controller.selectedPlanId.value == id
            ? AppColors.tertiaryText
            : AppColors.dividerColor;
        return Container(
          padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
          decoration: BoxDecoration(
            border: Border.all(color: outlineColor),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(6.w)),
          ),
          child: Column(
            children: [
              Icon(Icons.check_circle, size: 44.w, color: outlineColor),
              SizedBox(height: 15.h),
              Text(period, style: context.h4),
              Text('\$ $price', style: context.h4),
              SizedBox(height: 8.h),
              Text(
                info,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: context.subtitle2,
              )
            ],
          ),
        ).onTap(() {
          debugPrint('aaaaa');
          controller.selectedPlanId.value == 0 ? 1 : 0;
          controller.update();
        });
      },
    );
  }
}

// class _AccountPlanModel with ChangeNotifier {
//   _AccountPlanModel([this.selected = 0]);

//   int selected;

//   select(int id) {
//     selected = id;
//     notifyListeners();
//   }
// }
