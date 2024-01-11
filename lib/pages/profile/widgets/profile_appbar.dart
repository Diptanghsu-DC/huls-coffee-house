import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/profile/utils/colors.dart';
import 'package:huls_coffee_house/pages/profile/utils/styles.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GoBackButton(),
      title: const Text(
        'Profile',
        style: AppStyles.headingStyle,
      ),
      centerTitle: true,
    );
  }
}