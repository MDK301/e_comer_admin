import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/custom_textfield.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: editProfile, size: 16.0),
          actions: [
            TextButton(onPressed: () {}, child: normalText(text: save))
          ], // AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(imgProduct, width: 150)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              10.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: white),
                onPressed: () {},
                child: normalText(text: changeImage, color: fontGrey),
              ), // ElevatedButton
              10.heightBox,
              const Divider(color: white,),
              10.heightBox,
              customTextField(label: name, hint: "exp: CEO. Minh Handsome"),
              10.heightBox,
              customTextField(label: password, hint: passwordhint),
              10.heightBox,
              customTextField(label: confirmPassword, hint: passwordhint),

            ], // Column
          ), // Padding
        ));
  }
}
