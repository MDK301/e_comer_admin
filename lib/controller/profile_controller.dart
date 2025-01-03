import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/const/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController{
  late QueryDocumentSnapshot snapshotData;
  var profileImgPath = ''.obs;
  var profileImageLink = '';
  var isLoading=false.obs;

  //text field
  var nameController = TextEditingController();
  var oldpasswordController = TextEditingController();
  var newpasswordController = TextEditingController();

  //shop controller
  var shopnameController = TextEditingController();
  var shopaddressController = TextEditingController();
  var shopmobileController = TextEditingController();
  var shopwebsiteController = TextEditingController();
  var descriptionController = TextEditingController();


  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'image/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(vendorsCollection).doc(currentUser!.uid);
    await store.set({'vendor_name': name, 'password': password, 'imageUrl': imgUrl},
        SetOptions(merge: true));
    isLoading(false);
  }

  changePassword({email,password,newpassword})async{
    final cred=EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value){
      currentUser!.updatePassword(newpassword);
    }).catchError((error){
      print(error.toString());
    });
  }

  updateShop({shopname, shopaddress, shopmobile, shopwebsite, shopdesc}) async {
    var store = firestore.collection(vendorsCollection).doc(currentUser!.uid);
    await store.set({
      'shop_name': shopname,
      'shop_address': shopaddress,
      'shop_mobile': shopmobile,
      'shop_website': shopwebsite,
      'shop_desc': shopdesc,
    },
      SetOptions(merge: true),
    );
    isLoading(false);
  }

}