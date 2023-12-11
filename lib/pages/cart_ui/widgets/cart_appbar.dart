import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/colors.dart';
import 'package:huls_coffee_house/pages/cart_ui/utils/styles.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: AppColors.whiteColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
        onPressed: () {
          // Implement navigation to previous page here
        },
      ),
      title: const Text(
        'Cart',
        style: AppStyles.headingStyle,
      ),
      centerTitle: true,
    );
  }
}
