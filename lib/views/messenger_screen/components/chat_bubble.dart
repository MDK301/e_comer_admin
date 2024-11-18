import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

Widget chatBubble() {
  return Directionality(
    // textDirection: data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    textDirection: TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        // color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
        color: purpleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ), // BorderRadius.only // BoxDecoration
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // normalText(data['msg']! ?? "").make(),
          normalText(text: "message?"),

          10.heightBox,
          // normalText(text.time.text.white.size(16).make()),
          normalText(text: "10:45PM"),
        ],
      ),
    ),
  );
}