import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';
import 'package:e_comer_admin/controller/product_controller.dart';
import 'package:e_comer_admin/services/store_service.dart';
import 'package:e_comer_admin/views/products_screen/add_product.dart';
import 'package:e_comer_admin/views/products_screen/product_detail.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:e_comer_admin/views/widget/loading_indicator.dart';
import 'package:intl/intl.dart' as intl;

import '../widget/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller=Get.put(ProductController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: ()async {
          await controller.getCategories();
          controller.populateCategoryList();
          Get.to(() => const AddProduct());
        },
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appbarWidget(products),
      body: StreamBuilder(
          stream: StoreServices.getProducts(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      data.length,
                      (index) => Card(
                        child: ListTile(
                            onTap: () {
                              Get.to(() => ProductDetails(data: data[index],));
                            },
                            leading: Image.network(
                              data[index]['p_imgs'][0],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            title: boldText(
                              text: "${data[index]['p_name']}",
                              color: fontGrey,
                            ),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                normalText(
                                    text: "\$${data[index]['p_price']}",
                                    color: darkGrey),
                                10.widthBox,
                                boldText(
                                  text: data[index]['is_featured'] == true ? "Featured" : '',
                                  color: green,
                                )
                              ],
                            ),
                            trailing: VxPopupMenu(
                              arrowSize: 0.0,
                              menuBuilder: () => Column(
                                children: List.generate(
                                  popupMenuTitles.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Icon(popupMenuIcons[index]),
                                        15.widthBox,
                                        normalText(
                                            text: popupMenuTitles[index],
                                            color: darkGrey)
                                      ],
                                    ).onTap(() {}),
                                  ),
                                ),
                              ).box.white.rounded.width(200).make(),
                              clickType: VxClickType.singleClick,
                              child: Icon(Icons.more_vert_rounded),
                            )),
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
