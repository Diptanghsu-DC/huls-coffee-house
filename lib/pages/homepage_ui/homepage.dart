import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/homepage_ui/widgets/category_selector.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/widgets/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const String routeName = "/homePage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //getting the size of the screen
    getSize(context);

    return Scaffold(
      body: CustomBackground(
        bodyWidget: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "What would you like to order",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              //search bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search for food',
                  hintText: 'Search Your Food Item Here',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: const Color.fromARGB(255, 143, 142, 142),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.037,
                    fontWeight: FontWeight.w400,
                  ),
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 101, 100, 100)),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 192, 191, 191),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                      color: orange,
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
              CategoryButton(onTap: () {}, category: "nothing"),
            ].separate(20),
          ),
        ),
      ),
    );
  }
}
