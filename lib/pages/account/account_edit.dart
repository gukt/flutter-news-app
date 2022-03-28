import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/pages/account/account_controller.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/account_plan.dart';

class AccountEditPage extends StatelessWidget {
  const AccountEditPage({Key? key}) : super(key: key);

  // 付费计划
  _buildPlans(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: AccountPlanCard(
            id: 0,
            period: 'Month',
            price: '9.99',
            info: 'Billed every month',
          ),
        ),
        // 固定间隔, 左右两个付费计划 (flex = 1)
        SizedBox(width: 15.w),
        const Expanded(
          child: AccountPlanCard(
            id: 1,
            period: 'Year',
            price: '4.99/mo',
            info: 'Billed every 12 months',
          ),
        ),
      ],
    );
  }

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
          onTap: () {},
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
          _buildPlans(context),
          SizedBox(height: 15.h),
          AppTextButton(
            text: Text(
              r'Get Premium - $9.99',
              style: context.h4!.copyWith(color: Colors.white),
            ),
            width: double.infinity,
            backgroundColor: AppColors.primarySurface,
          ),
          _buildListTiles(context),
        ],
      ),
    );
  }
}
