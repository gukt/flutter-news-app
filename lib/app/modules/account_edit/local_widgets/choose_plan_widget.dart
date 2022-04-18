import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../global_widgets/custom_button.dart';
import '../../account/account_controller.dart';

class CustomChoosePlan extends GetView<AccountController> {
  const CustomChoosePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: CustomAccountPlan(
                1,
                'Month',
                '9.99',
                'Billed every month',
              ),
            ),
            // 固定间隔, 左右两个付费计划 (flex = 1)
            SizedBox(width: 15.w),
            const Expanded(
              child: CustomAccountPlan(
                2,
                'Year',
                '4.99/mo',
                'Billed every 12 months',
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        CustomTextButton(
          text: Obx(() => Text(
                'Get Premium - \$${controller.price}',
                style: context.h4!.copyWith(color: Colors.white),
              )),
          width: double.infinity,
          backgroundColor: AppColors.primarySurface,
        ),
        SizedBox(height: 15.h),
      ]),
    );
  }
}

/// 账户付费计划组件
class CustomAccountPlan extends StatelessWidget {
  const CustomAccountPlan(this.id, this.period, this.price, this.info,
      {Key? key})
      : super(key: key);

  final String period;
  final String price;
  final String info;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GetX<AccountController>(
      builder: (controller) {
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
          controller.selectedPlanId.value = id;
          controller.price.value = price;
        });
      },
    );
  }
}
