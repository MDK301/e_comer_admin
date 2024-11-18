import 'package:e_comer_admin/const/const.dart';
import 'package:e_comer_admin/views/widget/appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbarWidget(setting),

    );
  }
}
