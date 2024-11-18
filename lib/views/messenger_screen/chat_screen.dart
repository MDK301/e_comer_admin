import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/messenger_screen/components/chat_bubble.dart';
import 'package:e_comer_admin/views/widget/text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: darkGrey,
          onPressed: () {
            Get.back();
          },
        ),
        title: boldText(text: chat, size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 20, itemBuilder: ((context, index) {
                      return chatBubble();
                }))),
            10.heightBox,
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter message", isDense: true),
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: purpleColor,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
