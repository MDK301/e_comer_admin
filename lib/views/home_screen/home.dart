import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/controller/home_controller.dart';
import 'package:e_comer_admin/views/home_screen/home_screen.dart';
import 'package:e_comer_admin/views/orders_screen/orders_screen.dart';
import 'package:e_comer_admin/views/products_screen/products_screen.dart';
import 'package:e_comer_admin/views/profile_screen/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreens = [
      HomeScreen(),
      ProductsScreen(),
      OrdersScreen(),
      ProfileScreen()
    ];
    var bottomNavBar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'dashboard'),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProducts,
            color: darkGrey,
            width: 24,
          ),
          label: products),
      BottomNavigationBarItem(
          icon: Image.asset(
            icOrders,
            width: 24,
            color: darkGrey,
          ),
          label: orders),
      BottomNavigationBarItem(
          icon: Image.asset(
            icGeneralSettings,
            width: 24,
            color: darkGrey,
          ),
          label: setting),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          items: bottomNavBar),
      appBar: AppBar(),
      body: Obx(
        () => Column(
          children: [
            Expanded(child: navScreens.elementAt(controller.navIndex.value))
          ],
        ),
      ),
    );
  }
}
