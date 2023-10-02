import 'package:faizal_mobile_dev/presentation/homepage/view/home_page.dart';
import 'package:get/get.dart';

class GetxRoute {
  static final List<GetPage> routes = [
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      bindings: [HomepageBindings()]
    ),
  ];
}
