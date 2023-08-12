import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:greenedu/pages/application/application_view.dart';
import 'package:greenedu/pages/inforclasstotutor/inforclasstotutor_bindings.dart';
import 'package:greenedu/pages/signin/signin_bindings.dart';
import 'package:greenedu/pages/signin/signin_controller.dart';
import 'package:greenedu/pages/signin/signin_view.dart';
import 'package:greenedu/pages/signup/signup_bindings.dart';
import 'package:greenedu/pages/signup/signup_view.dart';
import 'package:greenedu/pages/welcome/welcome_bindings.dart';
import 'package:greenedu/pages/welcome/welcome_view.dart';
import 'package:greenedu/routes/names.dart';

import '../pages/application/application_bindings.dart';
import '../pages/chat/chat_bindings.dart';
import '../pages/chat/chat_view.dart';
import '../pages/inforclasstotutor/inforclasstotutor_view.dart';

class AppPages{
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SigninPage(),
      binding: SigninBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGN_UP,
      page: ()=>SignupPage(),
      binding: SignupBinding(),
    ),

    GetPage(
      name: AppRoutes.APPLICATION,
      page: ()=>ApplicationPage(),
      binding: ApplicationBinding(),
    ),

    GetPage(
      name: AppRoutes.INFORCLASSTOTUTOR,
      page: ()=>InforClassToTutorPage(),
      binding: InforClassToTutorBinding(),
    ),

    GetPage(
      name: AppRoutes.CHAT,
      page: ()=>ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}