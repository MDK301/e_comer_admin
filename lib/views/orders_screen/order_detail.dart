import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/orders_screen/component/order_place.dart';
import 'package:e_comer_admin/views/widget/our_button.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: darkGrey)), // IconButton
        title: boldText(text: "Order details", color: fontGrey, size: 16.0),
      ),bottomNavigationBar: SizedBox(
      height: 60,
      width: context.screenWidth,
      child: ourButton(color: green, onPress: () {}, title: "ConfirmOrder"),
    ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView( // Wrap the main content with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //order delivery status section
              Visibility(
                child: Column(

                  children: [
                    boldText(text: "Order status",color: fontGrey,size: 16.0),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Confirmed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "on Delivery", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Delivered", color: fontGrey),
                    ),


                  ],

                ).box.padding(EdgeInsets.all(8.0)).outerShadowMd.white.border(color: lightGrey).roundedSM.make(),
              ),


              //order detail section
              Column(
                children: [
                  orderPlaceDetails(
                      d1: "data['order_code']",
                      d2: "data['shipping_method']",
                      title1: "Order Code",
                      title2: "Shipping Method"),
                  orderPlaceDetails(
                    // d1: intl.DateFormat()
                    //     .add_yMd()
                    //     .format(data['order_date'].toDate()),
                      d1: DateTime.now(),
                      d2: "data['payment_method']",
                      title1: "Order Code",
                      title2: "Payment Method"),
                  orderPlaceDetails(
                      d1: "Unpaid",
                      d2: "OrderPlaced",
                      title1: "Payment Status",
                      title2: "Delivery Status"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Shipping Address".text.fontFamily(semibold).make(),
                            boldText(
                                text: "Shopping address", color: purpleColor),
                            "{data['order_by_name']}".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            "{data['order_by_postalcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "total amount", color: purpleColor),
                              boldText(
                                  text: "\$300", color: red, size: 16.0),

                              // "Total Amount".text.fontFamily(semibold).make(),
                              // "${data['total_amount']}"
                              //     .text
                              //     .color(redColor)
                              //     .fontFamily(bold)
                              //     .make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ).box.outerShadowMd.white.border(color: lightGrey).roundedSM.make(),
              const Divider(),
              10.heightBox,
              boldText(text: "oredered product", color: purpleColor),
              10.heightBox,
              ListView.builder( // Use ListView.builder for better performance
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3, // Replace with the actual number of ordered products
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlaceDetails(
                        title1: "data['orders'][index]['title']",
                        title2: " data['orders'][index]['tprice']",
                        d1: "{data['orders'][index]['qty']}x",
                        d2: "Refundable",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 30,
                          height: 20,
                          color: purpleColor,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}