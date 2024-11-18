import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/controller/product_controller.dart';
import 'package:e_comer_admin/views/products_screen/component/product_dropdown.dart';
import 'package:e_comer_admin/views/products_screen/component/product_images.dart';
import 'package:e_comer_admin/views/widget/custom_textfield.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: darkGrey)),
        title: boldText(text: "Add product", color: fontGrey, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: boldText(text: save, color: purpleColor))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(
                  hint: "eg. BMW",
                  label: "Product name",
                  controller: controller.pnameController),
              10.heightBox,
              customTextField(
                  hint: "eg. Nice product",
                  label: "Description",
                  isDesc: true,
                  controller: controller.pdescController),
              10.heightBox,
              customTextField(
                  hint: "eg. \$100",
                  label: "Price",
                  controller: controller.ppriceController),
              10.heightBox,
              customTextField(
                  hint: "eg. 20",
                  label: "Quantity",
                  controller: controller.pquantityController),
              10.heightBox,
              productDropdown("Category", controller.categoryList,
                  controller.categoryvalue, controller),
              10.heightBox,
              productDropdown("Subcategory", controller.subcategoryList,
                  controller.subcategoryvalue, controller),
              10.heightBox,
              Divider(
                color: white,
              ),
              normalText(text: "Product images"),
              10.heightBox,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                    (index) => controller.pImagesList[index] != null
                        ? Image.file(
                            controller.pImagesList[index],
                            width: 100,
                          ).onTap(() {
                            controller.pickImage(index, context);
                          })
                        : producImages(label: "${index + 1}").onTap(() {
                            controller.pickImage(index, context);
                          }),
                  ),
                ),
              ),
              5.heightBox,
              normalText(text: "First image will be your  display image"),
              10.heightBox,
              Divider(
                color: white,
              ),
              boldText(text: "Choose your product color"),
              10.heightBox,
              Obx(
                () => Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(
                    9,
                    (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        VxBox()
                            .color(Vx.randomPrimaryColor)
                            .roundedFull
                            .size(65, 65)
                            .make()
                            .onTap(() {
                          controller.selectedColorIndex.value = index;
                        }),
                        controller.selectedColorIndex.value == index
                            ? const Icon(Icons.done, color: white)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
