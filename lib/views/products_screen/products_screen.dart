import 'package:e_comer_admin/const/const.dart';
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
        onPressed: () {},
        child: Icon(Icons.add,color: white,),
      ),
      appBar:appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                onTap: () {},
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
                subtitle: normalText(
                  text: "\$40.0",
                  color: darkGrey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
