import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/extensions/context_ext.dart';
import 'package:flutter_news_app/common/extensions/widget_ext.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcomexxx'),
        actions: const [
          Icon(Icons.clear),
          Icon(Icons.search),
          Icon(Icons.cabin),
        ],
      ),
      body: Column(
        children: [
          Text('Headline 1', style: context.h1),
          Text('Headline 2', style: context.h2),
          Text('Headline 3', style: context.h3),
          Text('Headline 4', style: context.h4),
          Text('Headline 5', style: context.h5),
          Text('Headline 6', style: context.h6),

          Text('bodyText1', style: context.bodyText1),
          Text('bodyText2', style: context.bodyText2),
          Text('bodyText3', style: context.bodyText3),
          Text('bodyText4', style: context.bodyText4),
          Text('bodyText5', style: context.bodyText5),
          Text('bodyText6', style: context.bodyText6),

          // // 同时也更简洁的
          // Row(
          //   children: <Widget>[
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text('Sign In'),
          //       style: theme.textButtonTheme.style!.copyWith(
          //         fixedSize: MaterialStateProperty.all(
          //           Size(140.w, 44.h),
          //         ),
          //         backgroundColor: MaterialStateProperty.all(
          //           AppColors.secondarySurface,
          //         ),
          //         foregroundColor: MaterialStateProperty.all(
          //           Colors.white,
          //         ),
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text('Sign Up'),
          //       style: theme.textButtonTheme.style!.copyWith(
          //         fixedSize: MaterialStateProperty.all(
          //           Size(140.w, 44.h),
          //         ),
          //         backgroundColor: MaterialStateProperty.all(
          //           AppColors.primaySurface,
          //         ),
          //         // foregroundColor: MaterialStateProperty.all(
          //         //   Colors.white,
          //         // ),
          //       ),
          //     )
          //   ],
          // ),

          // Theme(
          //   // data: theme.copyWith(
          //   //   textButtonTheme: TextButtonThemeData(
          //   //     style: theme.textButtonTheme.style!.copyWith(
          //   //       fixedSize: MaterialStateProperty.all(
          //   //         Size(88.w, 44.h),
          //   //       ),
          //   //       shape: MaterialStateProperty.all(
          //   //         RoundedRectangleBorder(
          //   //           borderRadius: BorderRadius.all(Radius.circular(6.r)),
          //   //           side: const BorderSide(color: Colors.grey, width: 2),
          //   //         ),
          //   //       ),
          //   //     ),
          //   //   ),
          //   // ),
          //   data: ThemeData(
          //     textButtonTheme: TextButtonThemeData(
          //       style: ButtonStyle(
          //         fixedSize: MaterialStateProperty.all(
          //           Size(88.w, 44.h),
          //         ),
          //       ),
          //     ),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       TextButton(
          //         onPressed: () {},
          //         child: Image.asset("assets/images/icons-twitter.png"),
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: Image.asset("assets/images/icons-google.png"),
          //       ),
          //       TextButton(
          //         onPressed: () {},
          //         child: Image.asset("assets/images/icons-facebook.png"),
          //       )
          //     ],
          //   ),
          // ),
          // Row(
          //   children: <Widget>[
          //     SizedBox(
          //       width: 140.w,
          //       child: ElevatedButton(
          //         onPressed: () {},
          //         child: const Text('Sign In'),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 140.w,
          //       child: ElevatedButton(
          //         onPressed: () {},
          //         style: ButtonStyle(
          //           backgroundColor:
          //               MaterialStateProperty.all(AppColors.secondarySurface),
          //         ),
          //         child: const Text('Sign Up'),
          //       ),
          //     ),
          //   ],
          // ),
          // AppTextButton(
          //   'Sign Up',
          //   width: 140.w,
          //   // backgroundColor: const Color.fromRGBO(45, 45, 47, 1),
          //   // foregroundColor: Colors.white,
          //   onPressed: () {},
          // ),
          // AppTextButton(
          //   'Sign In',
          //   width: 140.w,
          //   backgroundColor: const Color.fromRGBO(41, 103, 255, 1),
          //   foregroundColor: Colors.white,
          //   onPressed: () {
          //     toast('Sign in clicked.');
          //   },
          // ),
          // Row(
          //   children: <Widget>[
          //     AppTextButton(
          //       'Twitter',
          //       borderColor: Colors.grey[200],
          //       padding: EdgeInsets.symmetric(horizontal: 5.h),
          //       onPressed: () {},
          //     ),
          //     AppTextButton(
          //       'Google',
          //       borderColor: Colors.grey[200],
          //       padding: EdgeInsets.symmetric(horizontal: 5.h),
          //       onPressed: () {},
          //     ),
          //     AppTextButton(
          //       'Facebook',
          //       borderWidth: 1,
          //       borderColor: Colors.grey[200],
          //       padding: EdgeInsets.symmetric(horizontal: 5.h),
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
          TextButton(
            onPressed: () {},
            child: const Text('Text Button1'),
            // style: ButtonStyle(
            //   overlayColor: MaterialStateProperty.all(Colors.red),
            //   backgroundColor:
            //       MaterialStateProperty.all(AppColors.primaySurface),
            //   foregroundColor: MaterialStateProperty.all(Colors.amber),
            // ),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ).expandWith(),
          const Divider(),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined Button12'),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.pink),
            //   foregroundColor: MaterialStateProperty.all(Colors.amber),
            // ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: ['hello', 'world', 'foo', 'bar']
            .map((item) => BottomNavigationBarItem(
                  icon: const Icon(Icons.add),
                  label: item,
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.clear),
      ),
    );
  }
}
