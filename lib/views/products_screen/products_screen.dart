import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/products_screen/add_product.dart';
import 'package:e_comer_admin/views/products_screen/product_detail.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:intl/intl.dart' as intl;

import '../widget/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => Card(
                child: ListTile(
                    onTap: () {
                      Get.to(() => ProductDetails());
                    },
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
                    subtitle:Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalText(text: "\$40.0", color: darkGrey),
                        10.widthBox,
                        boldText(text: "Featured", color: green),
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
      ),
    );
  }
}
