import 'package:e_comer_admin/const/const.dart';
 Widget producImages({required lable,onPress}){
   return "$lable".text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100, 100).roundedSM.make();
 }