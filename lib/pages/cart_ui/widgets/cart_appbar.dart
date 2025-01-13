import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/colors.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/styles.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GoBackButton(),
      title: const Text(
        'Cart',
        style: AppStyles.headingStyle,
      ),
      centerTitle: true,
    );
  }
}
