import 'package:get/get.dart';
import '../modules/splash/splash_view.dart';
import '../modules/home/home_view.dart';
import '../modules/detail/detail_view.dart';
import '../modules/tips/tips_view.dart';
import '../modules/chef/chef_view.dart';
import '../modules/contact/contact_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.SPLASH, page: () => SplashView()),
    GetPage(name: Routes.HOME, page: () => HomeView()),
    GetPage(name: Routes.DETAIL, page: () => DetailView()),
    GetPage(name: Routes.TIPS, page: () => TipsView()),
    GetPage(name: Routes.CHEF, page: () => ChefView()),
    GetPage(name: Routes.CONTACT, page: () => ContactView()),
  ];
}
