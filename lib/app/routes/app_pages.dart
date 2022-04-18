import 'package:flutter_news_app/app/modules/account/account_binding.dart';
import 'package:flutter_news_app/app/modules/account/account_view.dart';
import 'package:flutter_news_app/app/modules/sign_in/signin_view.dart';
import 'package:flutter_news_app/app/modules/sign_up/signup_view.dart';
import 'package:flutter_news_app/app/modules/welcome/welcome_view.dart';
import 'package:get/get.dart';

import '../modules/account_edit/account_edit_binding.dart';
import '../modules/account_edit/account_edit_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/search/search_view.dart';
import '../modules/sign_in/signin_binding.dart';
import '../modules/sign_up/signup_binding.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.home;

  // 定义命名路由
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
    ),
    GetPage(
      name: AppRoutes.account,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: AppRoutes.accountEdit,
      page: () => const AccountEditView(),
      binding: AccountEditBinding(),
    ),
  ];
}
