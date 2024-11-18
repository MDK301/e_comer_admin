import 'dart:io';

import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';
import 'package:e_comer_admin/controller/profile_controller.dart';
import 'package:e_comer_admin/views/widget/custom_textfield.dart';
import 'package:e_comer_admin/views/widget/loading_indicator.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;

  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();
  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print(currentUser!.uid);





    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: purpleColor,
          appBar: AppBar(
            title: boldText(text: editProfile, size: 16.0),
            actions: [
              controller.isLoading.value
                  ? loadingIndicator()
                  : TextButton(
                      onPressed: () async {
                        controller.isLoading(true);

                        //ko có ảnh
                        if (controller.profileImgPath.value.isNotEmpty) {
                          await controller.uploadProfileImage();
                        } else {
                          controller.profileImageLink =
                              controller.snapshotData['imageUrl'];
                        }
                        //check oldpass có trùng nhau không
                        if (controller.snapshotData['password'] ==
                            controller.oldpasswordController.text) {
                          print("vao if 1");

                          await controller.changePassword(
                              email: controller.snapshotData['email'],
                              password: controller.oldpasswordController.text,
                              newpassword: controller.newpasswordController.text);

                          await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.newpasswordController.text);

                          VxToast.show(context, msg: "Updated");

                        } else if (controller.oldpasswordController.text.isEmptyOrNull &&
                            controller.newpasswordController.text.isEmptyOrNull) {

                          print("vao if 2");
                          print(controller.nameController.text);
                          print(controller.oldpasswordController.text);
                          print(controller.newpasswordController.text);

                          await controller.updateProfile(
                              imgUrl: controller.profileImageLink,
                              name: controller.nameController.text,
                              password: controller.snapshotData['password']);

                          VxToast.show(context, msg: "Updated");

                        } else {
                          print("vao if 3");

                          VxToast.show(context, msg: "Wrong old password");
                          controller.isLoading(false);
                        }
                      },
                      child: normalText(text: save))
            ], // AppBar
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                controller.snapshotData['imageUrl'] == '' &&
                        controller.profileImgPath.isEmpty
                    //TH URL rỗng hoặc đường dẫn trong controoler bị hư
                    ? Image.asset(
                        imgProduct,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : controller.snapshotData['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        //TH URL ko rỗng nhung controller thi rong
                        ? Image.network(
                            controller.snapshotData['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: normalText(text: changeImage, color: fontGrey),
                ), // ElevatedButton
                10.heightBox,
                const Divider(
                  color: white,
                ),
                10.heightBox,
                customTextField(
                    label: name,
                    hint: "exp: CEO. Minh Handsome",
                    controller: controller.nameController),
                10.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(
                    text: "Change your password",
                  ),
                ),
                10.heightBox,
                customTextField(
                    label: password,
                    hint: passwordhint,
                    controller: controller.oldpasswordController),
                10.heightBox,
                customTextField(
                    label: newPassword,
                    hint: passwordhint,
                    controller: controller.newpasswordController),
              ], // Column
            ),
          ), // Padding
        ));
  }
}
