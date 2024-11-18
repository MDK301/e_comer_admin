import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/home_screen/home.dart';
import 'package:e_comer_admin/views/widget/our_button.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            30.heightBox,
            normalText(text: welcome, size: 18.0),
            20.heightBox,
            Row(
              children: [
                Image.asset(
                  icLogo,
                  width: 70,
                  height: 70,
                )
                    .box
                    .border(color: white)
                    .rounded
                    .padding(const EdgeInsets.all(8))
                    .make(),
                10.widthBox,
                boldText(text: appname, size: 20.0),
              ],
            ),
            20.heightBox,

            normalText(text: loginTo,size: 20.0),
            10.heightBox,
            Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: lightGrey,
                    filled: true,
                    prefixIcon: Icon(Icons.email, color: purpleColor),
                    border: InputBorder.none,
                    hintText: emailhint,
                  ),
                ),
                10.heightBox,
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: lightGrey,
                    filled: true,
                    prefixIcon: Icon(Icons.lock, color: purpleColor),
                    border: InputBorder.none,
                    hintText: passwordhint,
                  ),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child:
                          normalText(text: forgotPassword, color: purpleColor)),
                ),
                30.heightBox,
                SizedBox(
                    width: context.screenWidth - 100,
                    child: ourButton(title: login, onPress: () {
                      Get.to(Home());
                    })),
              ],
            )
                .box
                .white
                .rounded
                .outerShadowMd
                .padding(const EdgeInsets.all(8))
                .make(),
            10.heightBox,
            Center(
              child: normalText(text: anyProblem, color: lightGrey),
            ),
            const Spacer(),
            Center(
              child: boldText(text: credit),
            ),
            20.heightBox,
          ]),
        ),
      ),
    );
  }
}
