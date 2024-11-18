import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/orders_screen/order_detail.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(orders),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                onTap: () {
                  Get.to(()=>const OrderDetails());
                },
                tileColor: lightGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1)
                ),
                title: boldText(
                  text: "161464631215",
                  color: fontGrey,
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,color: fontGrey,),
                        10.heightBox,
                        boldText(text: intl.DateFormat().add_yMd().format(DateTime.now()),color: fontGrey)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month,color: fontGrey,),
                        10.heightBox,
                        boldText(text: unpaid,color: red)
                      ],
                    ),
                  ],
                ),
                trailing: boldText(text: "\$40.0",color: purpleColor,size: 16.0),
              ).box.white.margin(const EdgeInsets.only(bottom: 4)).make(),
            ),
          ),
        ),
      ),
    );
  }
}
