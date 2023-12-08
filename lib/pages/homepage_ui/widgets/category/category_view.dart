import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/category/category_selector.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/food/food_list.dart';

class CategoryViewer extends StatefulWidget {
  const CategoryViewer({super.key});

  @override
  State<CategoryViewer> createState() => _CategoryViewerState();
}

class _CategoryViewerState extends State<CategoryViewer> {
  @override
  Widget build(BuildContext context) {
    getSize(context);
    return SizedBox(
      height: height * 0.2,
      //creating a horizontal scrollable list of only categories
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 14,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return InkWell(
            splashColor: orange.withOpacity(0.7),
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            onTap: () {}, //navigate to respective page
            //each button styling
            child: CategoryButton(
              category: cat,
            ),
          );
        },
      ),
    );
  }
}
