import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  var navIndex=0.obs;
  var username='';

  getUsername()async{
    var n = await firestore.collection(vendorsCollection).where('id',isEqualTo: currentUser!.uid).get().then((value){
      if(value.docs.isNotEmpty){
        return value.docs.single['vendor_name'];
      }
    });

    username=n;
    print(username);
  }
}