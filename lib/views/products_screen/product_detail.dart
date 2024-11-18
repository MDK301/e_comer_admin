import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: darkGrey)),
        title: boldText(text: "Product title", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 350,
                itemCount: 3,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                itemBuilder: (context, index) {
                  return Image.asset(
                    imgProduct,
                    // data["p_imgs"][index],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "Product title", color: fontGrey, size: 16.0),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: "Category", color: fontGrey, size: 16.0),
                      10.widthBox,
                      normalText(text: "Subcategory", color: fontGrey, size: 16.0),
                    ], // Row
                  ),
                  10.heightBox,
                  // RATING
                  VxRating(
                    isSelectable: false,
                    // value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    // maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  boldText(text: "\$300", color: red, size: 18.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: boldText(text: "color", color: fontGrey)),
                          Row(
                            children: List.generate(
                              // data['p_colors'].length,
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(red)
                                  .margin(EdgeInsets.symmetric(horizontal: 6))
                                  .make()
                                  .onTap(() {}),
                            ),
                          ),
                        ],
                      ),

                      //quantity selection
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child:
                                  boldText(text: "Quantity", color: fontGrey)),
                          normalText(text: "20 items", color: fontGrey)
                        ],
                      ),
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),
                  Divider(),
                  //description section
                  10.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(text: "Description", color: fontGrey),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
