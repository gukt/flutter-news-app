import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/app_colors.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/widgets/app_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsViewPage extends StatelessWidget {
  const NewsViewPage({Key? key}) : super(key: key);

  _buildHead(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/figure-1.png',
            width: double.infinity,
            height: 207.h,
          ),
          Text(
            'I studied happiness, then realised I had to quit my job and leave the country',
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: context.h3,
          ),
          SizedBox(height: 15.h),
          Row(
            children: <Widget>[
              Text('Lifestyle', style: context.linkText),
              SizedBox(width: 15.w),
              Text('. 8m ago', style: context.subtitle1),
            ],
          ),
          SizedBox(height: 15.h)
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: const Text('''
When I began my research, I was motivated by the importance of the subject. Most people I knew wanted to be happy.

I thought, my research might help people to do that. I did what academics are incentivised to do: publish in peer-reviewed journals.
'''),
    );
  }

  _buildFollow(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(20.w),
      leading: Image.asset(
        'assets/images/channel-bbc.png',
        height: 44.w,
        width: 44.w,
      ),
      title: Text('BBC News', style: context.h4),
      subtitle: Text('By Henk Fortuin', style: context.subtitle1),
      trailing: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.secondarySurface,
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
        ),
        child: const Text('+ Follow'),
      ),
    );
  }

  _buildMore(BuildContext context) {
    return Column(
      children: <Widget>[
        const AppSection(
          title: Text('More in lifestyle'),
          trailing: Text('Show All'),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 15.w,
              children: [
                _buildMoreItem(context, 1),
                _buildMoreItem(context, 2),
                _buildMoreItem(context, 3),
                SizedBox(width: 20.w),
              ],
            ))
      ],
    );
  }

  _buildMoreItem(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/thumbnail-$index.png',
          width: 150.w,
          height: 160.h,
        ),
        SizedBox(height: 16.h),
        Container(
          width: 150.w,
          child: Text(
            'The one piece of advice women with careers',
            maxLines: 3,
            overflow: TextOverflow.clip,
            style: context.h4,
          ),
        ),
      ],
    );
  }

  _buildComment(BuildContext context, CommentEntity comment) {
    return Column(
      children: <Widget>[
        // 用户信息
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          // 替换成头像
          leading: Image.asset(
            'assets/images/account-avatar.png',
            width: 44.w,
            height: 44.w,
          ),
          title: Text(comment.name, style: context.h4),
          subtitle: Text(comment.createdAt, style: context.subtitle1),
          trailing: const Icon(Icons.more_horiz),
        ),
        Padding(
          padding: EdgeInsets.only(left: 76.w, right: 20.w),
          child: Text(
            comment.content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // 评论正文
      ],
    );
  }

  _buildComments(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(20.w),
          title: Text('Comments', style: context.h4),
          trailing: Text('+ To Write', style: context.linkText),
        ),
        _buildComment(
          context,
          CommentEntity(
            name: 'Sophie French',
            content:
                'Great news! This will get a lot more people to protest. It’s very sad all they wanted is democracy and freedom.',
            createdAt: '28 May at 09:38',
          ),
        ),
        _buildComment(
          context,
          CommentEntity(
            name: 'Sophie French',
            content:
                'Great news! This will get a lot more people to protest. It’s very sad all they wanted is democracy and freedom.',
            createdAt: '28 May at 09:38',
          ),
        ),
        _buildComment(
          context,
          CommentEntity(
            name: 'Sophie French',
            content:
                'Great news! This will get a lot more people to protest. It’s very sad all they wanted is democracy and freedom.',
            createdAt: '28 May at 09:38',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHead(context),
              _buildBody(context),
              _buildFollow(context),
              _buildMore(context),
              _buildComments(context),
              SizedBox(height: 18.h),
            ],
          ),
        ));
  }
}

class CommentEntity {
  final String name;
  final String content;
  final String createdAt;

  CommentEntity({
    required this.name,
    required this.content,
    required this.createdAt,
  });
}
