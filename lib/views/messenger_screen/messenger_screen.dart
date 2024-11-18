import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/messenger_screen/chat_screen.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: darkGrey, onPressed: () { Get.back(); },
        ),
        title: boldText(text: messages, size: 16.0, color: fontGrey),
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                  onTap: (){
                    Get.to(() => ChatScreen());

                  },
                      leading: CircleAvatar(
                          backgroundColor: purpleColor,
                          child: Icon(Icons.person,color: white,)),
                  title: boldText(text: "Username",color: darkGrey),
                  subtitle: normalText(text: "last message... ",color: darkGrey),
                  trailing: normalText(text: "10:45PM",color: darkGrey),
                    )),
          ),
        ),
      ),
    );
  }
}
