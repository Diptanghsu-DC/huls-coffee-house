import 'package:flutter/material.dart';
import 'package:huls_coffee_house/pages/view_product_page/components/itemscard.dart';

class Test extends StatelessWidget {
  static const String routeName = '/test';
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            ItemsCard(),
            ItemsCard(),
            ItemsCard(),
            ItemsCard(),
            ItemsCard(),
          ],
        ),
    )
    ;
  }

  Widget _getitem() {
    return ItemsCard();
  }
  
}
