import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';
import 'package:e_comer_admin/services/store_service.dart';
import 'package:e_comer_admin/views/messenger_screen/chat_screen.dart';
import 'package:e_comer_admin/views/widget/loading_indicator.dart';
import 'package:intl/intl.dart'as intl;

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

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
          title: boldText(text: messages, size: 16.0, color: fontGrey),
        ), // AppBar
        body: StreamBuilder(
          stream: StoreServices.getMessages(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
var data=snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(

                        data.length,
                            (index) {
                              var t = data[index]['created_on'] == null ? DateTime.now() : data[index]['created_on'].toDate();
                              var time = intl.DateFormat("h:mma").format(t);
                          return ListTile(
                              onTap: (){
                                Get.to(() => ChatScreen());

                              },
                              leading: CircleAvatar(
                                  backgroundColor: purpleColor,
                                  child: Icon(Icons.person,color: white,)),
                              title: boldText(text: "${data[index]['sender_name']}",color: darkGrey),
                              subtitle: normalText(text: "${data[index]['last_msg']}",color: darkGrey),
                              trailing: normalText(text: time,color: darkGrey),
                            );}),
                  ),
                ),
              );
            }
          },
          // StreamBuilder
        ));
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: SingleChildScrollView(
    //     physics: const BouncingScrollPhysics(),
    //     child: Column(
    //       children: List.generate(
    //           20,
    //           (index) => ListTile(
    //             onTap: (){
    //               Get.to(() => ChatScreen());
    //
    //             },
    //                 leading: CircleAvatar(
    //                     backgroundColor: purpleColor,
    //                     child: Icon(Icons.person,color: white,)),
    //             title: boldText(text: "Username",color: darkGrey),
    //             subtitle: normalText(text: "last message... ",color: darkGrey),
    //             trailing: normalText(text: "10:45PM",color: darkGrey),
    //               )),
    //     ),
    //   ),
    // ),
    // );
  }
}
