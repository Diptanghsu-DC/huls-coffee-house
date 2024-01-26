import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/utils.dart';
import 'package:huls_coffee_house/widgets/custom_background_image/custom_background_image.dart';

class CurrentOrders extends StatefulWidget {
  const CurrentOrders({super.key});

  static const String routeName = "/currentOrders";

  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> {
  Future<void> refresh() async {
    setState(() {
      // init();
    });
  }

  @override
  Widget build(BuildContext context) {
    getSize(context);
    return RefreshIndicator(
      onRefresh: refresh,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: const GoBackButton(),
        body: Stack(
          children: [
            CustomBackground(
              bodyWidget: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 130.0,
                ),
                child: !UserController.currentUser!.isSeller
                    ? StreamBuilder<List<OrderModel>>(
                        stream: OrderController.get(
                            user: UserController.currentUser!.name),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: orange,
                            ));
                          } else if (!snapshot.hasData) {
                            return const Text(
                              "No current orders",
                              style: TextStyle(fontSize: 100),
                            );
                          }
                          List<OrderModel> orders = snapshot.data ?? [];
                          if (orders.isEmpty) {
                            return Center(
                              child: Text(
                                "No current orders",
                                style: TextStyle(
                                  fontSize: width * 0.07,
                                  color: Color.fromARGB(255, 107, 106, 106),
                                ),
                              ),
                            );
                          }
                          return Expanded(
                            child: ListView.builder(
                              itemCount: orders.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      orders[index].product,
                                      style: TextStyle(
                                        fontSize: width * 0.06,
                                        color: const Color.fromARGB(
                                            255, 57, 57, 60),
                                        fontFamily: "SofiaPro",
                                      ),
                                    ),
                                    Text(
                                      "${orders[index].quantity}",
                                      style: TextStyle(
                                        fontSize: width * 0.06,
                                        color: const Color.fromARGB(
                                            255, 57, 57, 60),
                                        fontFamily: "SofiaPro",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
