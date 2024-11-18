import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/products_screen/component/product_dropdown.dart';
import 'package:e_comer_admin/views/products_screen/component/product_images.dart';
import 'package:e_comer_admin/views/widget/custom_textfield.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
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
              customTextField(hint: "eg. BMW", label: "Product name"),
              10.heightBox,
              customTextField(
                  hint: "eg. Nice product", label: "Description", isDesc: true),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. 20", label: "Quantity"),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              Divider(color: white,),
              normalText(text: "Product images"),
              10.heightBox,
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) => producImages(lable: "${index+1}")),
              ),
              5.heightBox,
              normalText(text: "First image will be your  display image"),
              10.heightBox,
              Divider(color: white,),
              boldText(text: "Choose your product color"),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  9,
                      (index) => Stack(
                    alignment: Alignment.center,
                    children: [
                      VxBox().color(Vx.randomPrimaryColor).roundedFull.size(70, 70).make(),
                      const Icon(Icons.done, color: white),
                    ],
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
