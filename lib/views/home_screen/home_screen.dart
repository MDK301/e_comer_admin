import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:e_comer_admin/views/widget/dashboard_button.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: products, count: "60", icon: icProducts),
                dashboardButton(context,
                    title: orders, count: "15", icon: icOrders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: rating, count: "60", icon: icStar),
                dashboardButton(context,
                    title: totalSales, count: "15", icon: icOrders),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            Align(
                alignment: Alignment.centerLeft,
                child: boldText(
                    text: popularProducts, color: darkGrey, size: 16.0)),
            20.heightBox,
            ListView(
              physics:
              const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                3,
                (index) => ListTile(
                  onTap: (){},
                  leading: Image.asset(
                    imgProduct,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(
                    text: "Product title",
                    color: fontGrey,
                  ),
                  subtitle: normalText(
                    text: "\$40.0",
                    color: darkGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
