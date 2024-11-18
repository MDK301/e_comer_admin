import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';
import 'package:e_comer_admin/controller/auth_controller.dart';
import 'package:e_comer_admin/controller/profile_controller.dart';
import 'package:e_comer_admin/services/store_service.dart';
import 'package:e_comer_admin/views/auth_screen/login_screen.dart';
import 'package:e_comer_admin/views/messenger_screen/messenger_screen.dart';
import 'package:e_comer_admin/views/profile_screen/edit_profile_screen.dart';
import 'package:e_comer_admin/views/shop_screen/shop_setting_screen.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:e_comer_admin/views/widget/loading_indicator.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: settings, size: 16.0),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => EditProfileScreen());
                },
                icon: const Icon(Icons.edit)),
            TextButton(
                onPressed: () async {
                  await Get.find<AuthController>().signoutMenthod(context);
                  Get.offAll(() => LoginScreen());
                },
                child: normalText(text: logout)),
          ],
        ),
        body: FutureBuilder(
          future: StoreServices.getProfile(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator(circleColor: white);
            } else {
              controller.snapshotData= snapshot.data!.docs[0];

              return Column(
                children: [
                  ListTile(
                    leading: Image.asset(imgProduct)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    title: boldText(text: "${controller.snapshotData['vendor_name']}"),
                    subtitle: normalText(text: "${controller.snapshotData['email']}"),
                  ), // ListTile
                  const Divider(),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        profileButtonsIcons.length,
                            (index) => ListTile(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Get.to(() => ShopSettings());
                                break;
                              case 1:
                                Get.to(() => MessagesScreen());
                                break;
                              default:
                            }
                          },
                          leading: Icon(profileButtonsIcons[index], color: white),
                          title: normalText(text: profileButtonsTitles[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              );

            }
          },
          // FutureBuilder
        ));
    // Column(
    //   children: [
    //     ListTile(
    //       leading: Image.asset(imgProduct)
    //           .box
    //           .roundedFull
    //           .clip(Clip.antiAlias)
    //           .make(),
    //       title: boldText(text: "Vendor name"),
    //       subtitle: normalText(text: "vendoremail@emart.com"),
    //     ), // ListTile
    //     const Divider(),
    //     10.heightBox,
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: List.generate(
    //           profileButtonsIcons.length,
    //           (index) => ListTile(
    //             onTap: () {
    //               switch (index) {
    //                 case 0:
    //                   Get.to(() => ShopSettings());
    //                   break;
    //                 case 1:
    //                   Get.to(() => MessagesScreen());
    //                   break;
    //                 default:
    //               }
    //             },
    //             leading: Icon(profileButtonsIcons[index], color: white),
    //             title: normalText(text: profileButtonsTitles[index]),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
