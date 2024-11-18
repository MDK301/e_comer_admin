import 'package:e_comer_admin/const/const.dart';


Widget loadingIndicator(){
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(red),
  );
}