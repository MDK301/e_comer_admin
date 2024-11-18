import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

Widget customTextField({label, hint, controller}) {
  return TextFormField(
      decoration: InputDecoration(
    isDense: true,
    label: normalText(text: label),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: white,
      ),
    ),
    hintText: hint,
    hintStyle: const TextStyle(color: lightGrey),
  ));
}
