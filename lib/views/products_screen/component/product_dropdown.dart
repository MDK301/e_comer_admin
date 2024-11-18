import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: normalText(text: "Choose category",color: fontGrey),
        value: null,
        isExpanded: true,
        items: const [],
        onChanged: (value) {},
      ) // DropdownButton
  ).box.white.padding(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
}