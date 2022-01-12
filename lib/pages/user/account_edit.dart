import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountEditPage extends StatefulWidget {
  const AccountEditPage({Key? key}) : super(key: key);

  @override
  State<AccountEditPage> createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  @override
  Widget build(BuildContext context) {
    const _arrowIcon = Icon(Icons.keyboard_arrow_right);
    return Scaffold(
      // 因为下半部分内容是在灰色背景上显示白色, 所以要设置一下背景色为灰色
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 顶部: 头像, 账号剩余天数, 选择计划
            Container(
              // 拉宽到屏幕宽度
              width: double.infinity,
              color: AppColors.primaryBackground,
              padding: EdgeInsets.fromLTRB(0.w, 8.h, 0.w, 20.h),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Account', style: context.h2),
                    subtitle:
                        Text('Premium - 12 days', style: context.subtitle1),
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
                    trailing: Icon(Icons.info_outline),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const _AccountPlan(
                              period: 'Month',
                              price: '9.99',
                              info: 'Billed every month',
                              selected: true,
                            ),
                            SizedBox(width: 15.w),
                            const _AccountPlan(
                              period: 'Year',
                              price: '4.99/mo',
                              info: 'Billed every 12 months',
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        AppTextButton(
                          Text(
                            r'Get Premium - $9.99',
                            style: context.h4!.copyWith(color: Colors.white),
                          ),
                          width: double.infinity,
                          backgroundColor: AppColors.secondarySurface,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
              onTap: () {},
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

class _AccountPlan extends StatefulWidget {
  final String period;
  final String price;
  final String info;
  final bool selected;

  const _AccountPlan({
    Key? key,
    required this.period,
    required this.price,
    required this.info,
    this.selected = false,
  }) : super(key: key);

  @override
  _AccountPlanState createState() => _AccountPlanState();
}

class _AccountPlanState extends State<_AccountPlan> {
  static bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('building _AccountPlanState');
    Color? outlineColor =
        _selected ? AppColors.tertiaryText : AppColors.dividerColor;
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
        decoration: BoxDecoration(
          border: Border.all(color: outlineColor),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
        ),
        child: Column(
          children: [
            Icon(
              Icons.check_circle,
              size: 44.w,
              color: outlineColor,
            ),
            SizedBox(height: 15.h),
            Text(widget.period, style: context.h4),
            Text('\$ ${widget.price}', style: context.h4),
            SizedBox(height: 8.h),
            Text(
              widget.info,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: context.subtitle2,
            )
          ],
        ),
      ).onTap(() {
        setState(() {
          _selected = !_selected;
        });
      }),
    );
  }
}
