import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_news_app/app/modules/account/account_controller.dart';
import 'package:flutter_news_app/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_borders.dart';
import '../../core/theme/app_colors.dart';
import '../../global_widgets/custom_button.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _arrowIcon = Icon(Icons.keyboard_arrow_right);
    return Scaffold(
      // 因为下半部分内容是在灰色背景上显示白色, 所以要设置一下背景色为灰色
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.accountEdit),
            icon: const Icon(Icons.edit_note),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 顶部: 头像, 昵称, 邮箱, 按钮
            Container(
              // 拉宽到屏幕宽度
              width: double.infinity,
              color: AppColors.primaryBackground,
              padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
              child: Column(
                children: [
                  Container(
                    width: 108.w,
                    height: 108.w,
                    padding: EdgeInsets.all(10.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [primaryShadow],
                    ),
                    child: CircleAvatar(
                      child: Image.asset(
                        'assets/images/account-avatar.png',
                        width: 88.w,
                        height: 88.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text('Cameron Rogers', style: context.h3),
                  SizedBox(height: 10.h),
                  Text('@boltrogers', style: context.bodyText3),
                  SizedBox(height: 24.h),
                  CustomTextButton(
                    onTaped: () => Get.toNamed(AppRoutes.accountEdit),
                    text: Text(
                      r'Get Premium - $9.99',
                      style: context.h4!.copyWith(color: Colors.white),
                    ),
                    width: double.infinity,
                    backgroundColor: AppColors.primarySurface,
                    // TODO 这里没起作用, 非要写到 text 上设置?
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            ListTile(
              onTap: () {},
              title: Text('Email', style: context.h4),
              trailing: const Text('boltrogers@gmail.com'),
            ),
            SizedBox(height: 10.h),
            ListTile(
              onTap: () {},
              title: Text('Favorite channels', style: context.h4),
              trailing: Wrap(
                children: [const Text('12'), SizedBox(width: 12.w), _arrowIcon],
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              enableFeedback: true,
              title: Text('Bookmarks', style: context.h4),
              trailing: Wrap(
                children: [
                  const Text('294'),
                  SizedBox(width: 12.w),
                  _arrowIcon
                ],
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text('Popular categories', style: context.h4),
              trailing: Wrap(
                children: [
                  const Text('7'),
                  SizedBox(width: 12.w),
                  _arrowIcon,
                ],
              ),
            ),
            SizedBox(height: 10.h),

            ListTile(
              onTap: () {},
              title: Text('Newsletter', style: context.h4),
              trailing: _arrowIcon,
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: Text('Settings', style: context.h4),
              trailing: _arrowIcon,
            ),
            SizedBox(height: 10.h),

            ListTile(
              onTap: () => Get.offNamed(AppRoutes.signIn),
              title: Text('Log out', style: context.h4),
              trailing: _arrowIcon,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
