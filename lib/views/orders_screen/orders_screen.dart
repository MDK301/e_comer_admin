import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';
import 'package:e_comer_admin/controller/orders_controller.dart';
import 'package:e_comer_admin/services/store_service.dart';
import 'package:e_comer_admin/views/orders_screen/order_detail.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:e_comer_admin/views/widget/loading_indicator.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());

    return Scaffold(
      appBar: appbarWidget(orders),
      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(data.length, (index) {
                    var time=data[index]['order_date'].toDate();

                    return ListTile(
                      onTap: () {
                        Get.to(() => OrderDetails(data: data[index],));
                      },
                      tileColor: lightGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1)),
                      title: boldText(
                        text: "${data[index]['order_code']}",
                        color: fontGrey,
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: fontGrey,
                              ),
                              10.heightBox,
                              boldText(
                                  text: intl.DateFormat()
                                      .add_yMd()
                                      .format(time),
                                  color: fontGrey)
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: fontGrey,
                              ),
                              10.heightBox,
                              boldText(text: unpaid, color: red)
                            ],
                          ),
                        ],
                      ),
                      trailing: boldText(
                          text: "\$ ${data[index]['total_amount']}", color: purpleColor, size: 16.0),
                    ).box.white.margin(const EdgeInsets.only(bottom: 4)).make();
                  }),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
