import 'package:flutter/material.dart';
import 'package:flutter_news_app/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Walk through step-1 page
class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  /// 构建头部标题
  Widget _buildHeadTitle() {
    return Container(
      // NOTE: 要算上顶部的 App bar 区域高度
      margin: EdgeInsets.only(top: (65 + 44).h),
      child: Text(
        'Features',
        style: TextStyle(
          fontSize: 24.sp,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 构建标题下面的子标题
  Widget _buildHeadSubtitle() {
    return Container(
      width: 242.w,
      height: 70.h,
      margin: EdgeInsets.only(top: 14.h),
      child: Text(
        'The best of news channels all in one place. Trusted sources and personalized news for you.',
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: 'Avenir',
        ),
      ),
    );
  }

  /// 构建 Feature List
  Widget _buildFeatureList() {
    return SizedBox(
      width: 295.w,
      child: Column(
        children: <Widget>[
          _buildFeatureListItem(
            'feature-1',
            "Compelling photography and typography provide a beautiful reading",
            marginTop: 86.h,
          ),
          _buildFeatureListItem(
            'feature-2',
            'Sector news never shares your personal data with advertisers or publishers',
            marginTop: 40.h,
          ),
          _buildFeatureListItem(
            'feature-3',
            'You can get Premium to unlock hundreds of publications',
            marginTop: 40.h,
          ),
        ],
      ),
    );
  }

  /// 构建类似 [ListTile] 的特征项
  ///
  /// Params:
  /// * [leadingName] - 前面的图片名称（不包含扩展名）
  /// * [intro] - 介绍文字
  /// * [marginTop] 距离顶部的边距
  Widget _buildFeatureListItem(
    String leadingImage,
    String intro, {
    double marginTop = 24,
  }) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        children: [
          Image.asset(
            'assets/images/$leadingImage.png',
            width: 80.w,
            height: 80.w,
            // TODO ?
            fit: BoxFit.none,
          ),
          const Spacer(),
          // NOTE: 子节点文本要套在一个容器中，不然会发生 overflow
          SizedBox(
            width: 195.w,
            // alignment: Alignment.topLeft,
            child: Text(
              intro,
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建底部按钮
  Widget _buildBottomButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 41.h),
      child: AppTextButton(
        const Text('Get Started'),
        // TODO 这里要考虑一下如何更合理，设置了水平方向上 margin，理论上来说是否不用设置 width 了，考虑tight 和 loose 的情况
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        backgroundColor: const Color.fromRGBO(41, 103, 255, 1),
        foregroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // 标题
            _buildHeadTitle(),
            // 子标题
            _buildHeadSubtitle(),
            // 特性列表
            _buildFeatureList(),
            const Spacer(),
            // 底部按钮
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }
}
