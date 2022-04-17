import 'package:flutter/material.dart';
import 'package:flutter_news_app/app/core/extensions/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../core/theme/app_colors.dart';
import '../../data/providers/remote/news_api.dart';
import '../../global_widgets/app_input.dart';
import '../../global_widgets/widgets.dart';

class SearchByCategoryView extends StatelessWidget {
  const SearchByCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var selectedCategories = [];
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: context.theme.iconTheme.size,
          ),
        ),
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              // flutter 不会对 IconButton 中的图标应用全局设定的图标样式
              size: context.theme.iconTheme.size,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20.w, 6.h, 20.w, 10.h),
            child: const AppTextField(
              hintText: 'Search...',
            ),
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder(
                future: NewsApi.getCategories(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) return Container();
                  var arr = ['For You'];
                  for (var e in snapshot.data!) {
                    arr.add(e['name'] as String);
                  }
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(arr[index], style: context.h2),
                        value: false,
                        onChanged: (bool? value) {},
                      );
                    },
                    // 每行后面跟一个分隔符
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: arr.length,
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(20.w),
            child: AppTextButton(
              text: Text(
                'Show news',
                style: context.h4!.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primarySurface,
              width: double.infinity,
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
