import 'package:e_comer_admin/const/const.dart';


Widget loadingIndicator({circleColor=red}){
  return  Center(
    child:  CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circleColor),
    ),
  );
}