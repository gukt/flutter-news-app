import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_news_app/app/modules/account/account_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../global_widgets/custom_button.dart';
import '../../routes/app_pages.dart';
import 'local_widgets/choose_plan_widget.dart';

class AccountEditView extends GetView<AccountController> {
  const AccountEditView({Key? key}) : super(key: key);

  _buildListTiles(BuildContext context) {
    const _arrowIcon = Icon(Icons.keyboard_arrow_right);
    return Column(
      children: [
        SizedBox(height: 10.h),
        ListTile(
          onTap: () {},
          title: Text('Full name', style: context.h4),
          trailing: const Text('Gabriel Matusov'),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          title: Text('Email', style: context.h4),
          trailing: const Text('boltrogers@gmail.com'),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          title: Text('Country', style: context.h4),
          trailing: Wrap(
            children: [
              const Text('Finland'),
              SizedBox(width: 12.w),
              _arrowIcon,
            ],
          ),
        ),
        const Divider(),
        ListTile(
          onTap: () {},
          enableFeedback: true,
          title: Text('City', style: context.h4),
          trailing: Wrap(
            children: [
              const Text('Helsinki'),
              SizedBox(width: 12.w),
              _arrowIcon
            ],
          ),
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
            children: [const Text('294'), SizedBox(width: 12.w), _arrowIcon],
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 因为下半部分内容是在灰色背景上显示白色, 所以要设置一下背景色为灰色
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text('Account', style: context.h2),
            subtitle: Text('Premium - 12 days', style: context.subtitle1),
            trailing: CircleAvatar(
              radius: 44.w,
              child: Image.asset('assets/images/account-avatar.png'),
            ),
          ),
          SizedBox(height: 12.h),
          const Divider(),
          // Choose plan
          ListTile(
            title: Text('Choose your plain', style: context.h4),
            trailing: const Icon(Icons.info_outline),
          ),
          const CustomChoosePlan(),
          _buildListTiles(context),
        ],
      ),
    );
  }
}
