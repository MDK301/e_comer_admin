import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/custom_textfield.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            customTextField(hint: "eg. BMW", label: "Product name"),
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
