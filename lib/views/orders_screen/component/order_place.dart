
import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

Widget orderPlaceDetails({data, title1, title2, d1, d2}){
  return Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "$title1".text.fontFamily(semibold).make(),
            // "$d1".text.color(redColor).fontFamily(semibold).make()
            boldText(text: "$title1", color: purpleColor),
            boldText(text: "$d1", color: red)
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "$title2".text.fontFamily(semibold).make(),
              // "$d2".text.make(),
              boldText(text: "$title2", color: purpleColor),
              boldText(text: "$d2", color: fontGrey)
            ],
          ),
        )
      ],
    ),
  );
}