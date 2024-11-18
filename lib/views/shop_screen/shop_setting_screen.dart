import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/controller/profile_controller.dart';
import 'package:e_comer_admin/views/widget/custom_textfield.dart';
import 'package:e_comer_admin/views/widget/loading_indicator.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
          backgroundColor: purpleColor,
          appBar: AppBar(
            title: boldText(text: shopSettings, size: 16.0),
            actions: [
              controller.isLoading.value
                  ? loadingIndicator(circleColor: white)
                  : TextButton(
                      onPressed: () async{
                        controller.isLoading(true);
                        await controller.updateShop(
                          shopaddress: controller.shopaddressController.text,
                          shopname: controller.shopnameController.text,
                          shopmobile: controller.shopmobileController.text,
                          shopwebsite: controller.shopwebsiteController.text,
                          shopdesc: controller.descriptionController.text,
                        );
                        VxToast.show(context, msg: "Shop update");

                      },
                      child: normalText(text: save)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                customTextField(
                    label: shopName,
                    hint: nameHint,
                    controller: controller.shopnameController),
                10.heightBox,
                customTextField(
                    label: address,
                    hint: shopAddressHint,
                    controller: controller.shopaddressController),
                10.heightBox,
                customTextField(
                    label: mobile,
                    hint: shopMobileHint,
                    controller: controller.shopmobileController),
                10.heightBox,
                customTextField(
                    label: website,
                    hint: shopWebsiteHint,
                    controller: controller.shopwebsiteController),
                10.heightBox,
                customTextField(
                    isDesc: true,
                    label: description,
                    hint: shopDescHint,
                    controller: controller.descriptionController),
              ], // Column
            ), // Padding),
          )),
    );
  }
}
