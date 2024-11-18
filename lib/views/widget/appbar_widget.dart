import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';
import 'package:intl/intl.dart' as intl;

AppBar appbarWidget(title){
  return AppBar(
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: darkGrey, size: 16.0),
    actions: [
      Center(
        child: normalText(
          text: intl.DateFormat('EEE, MMM d, \'yy').format(DateTime.now()),
          color: purpleColor,
        ),
      ),
      10.widthBox,
    ],
  );
}