import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/edit_item_box.dart';

class ItemBox extends StatefulWidget {
  final Item item;

  const ItemBox({super.key, required this.item});

  @override
  State<ItemBox> createState() {
    return _ItemBoxState();
  }
}

class _ItemBoxState extends State<ItemBox> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    double boxWidth = 1500.0;
    return !isEditMode
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: boxWidth,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    // Placeholder for image
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        widget.item.product!.itemName,
                        style: const TextStyle(
                            fontFamily: 'SofiaPro',
                            fontWeight: FontWeight.bold),
                      )),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "${widget.item.product!.quantity}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: incrementCounter,
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 255, 255, 255),
                          //     elevation: 8.0,
                          //     shadowColor: Colors.orange,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(8.0),
                          //     ),
                          //   ),
                          //   child: const Icon(Icons.add),
                          // ),
                          // const SizedBox(width: 8),
                          // ElevatedButton(
                          //   onPressed: decrementCounter,
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 255, 255, 255),
                          //     elevation: 8.0,
                          //     shadowColor: Colors.orange,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(8.0),
                          //     ),
                          //   ),
                          //   child: const Icon(Icons.remove),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.item.product!.itemDesc ?? "",
                    style: const TextStyle(fontFamily: 'SofiaPro'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditMode = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'SofiaPro'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : ElevatedItemBox(item: Item(product: widget.item.product));
  }
}
