import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/category/category_selector.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

class CategoryViewer extends StatefulWidget {
  const CategoryViewer({super.key});

  @override
  State<CategoryViewer> createState() => _CategoryViewerState();
}

class _CategoryViewerState extends State<CategoryViewer> {
  @override
  Widget build(BuildContext context) {
    getSize(context);
    return StreamBuilder(
      stream: ProductController.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: orange,));
        } else {
          final categories = snapshot.data!
              .map((product) => product.category)
              .toSet()
              .toList();
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewAll(
                          category: cat,
                        ),
                      ),
                    );
                  }, //navigate to respective page
                  //each button styling
                  child: CategoryButton(
                    category: cat,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
