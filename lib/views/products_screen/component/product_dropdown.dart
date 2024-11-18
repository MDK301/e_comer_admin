import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/controller/product_controller.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

Widget productDropdown(
    hint, List<String> list, dropvalue, ProductController controller) {
  return Obx(
    () => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
      hint: normalText(text: "$hint", color: fontGrey),
      value: dropvalue.value == '' ? null : dropvalue.value,
      isExpanded: true,
      items: list.map((e) {
        return DropdownMenuItem(
          child: e.toString().text.make(),
          value: e,
        );
      }).toList(),
      onChanged: (newValue) {
        if (hint == "Category") {
          controller.subcategoryvalue.value = '';
          controller.populateSubcategory(newValue.toString());
        }
        dropvalue.value = newValue.toString();
      },
    ))
        .box
        .white
        .padding(const EdgeInsets.symmetric(horizontal: 4))
        .roundedSM
        .make(),
  );
}
