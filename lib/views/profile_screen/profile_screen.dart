import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/messenger_screen/messenger_screen.dart';
import 'package:e_comer_admin/views/profile_screen/edit_profile_screen.dart';
import 'package:e_comer_admin/views/shop_screen/shop_setting_screen.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          TextButton(onPressed: () {}, child: normalText(text: logout)),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgProduct)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            title: boldText(text: "Vendor name"),
            subtitle: normalText(text: "vendoremail@emart.com"),
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
      ),
    );
  }
}
