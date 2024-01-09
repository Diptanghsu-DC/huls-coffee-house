import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/edit_item_box.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';

class AddNewItem extends StatelessWidget {
  const AddNewItem({super.key});

  @override
  Widget build(context) {
    final Item item = Item();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const GoBackButton(),
      body: ElevatedItemBox(item: item),
    );
  }
}
