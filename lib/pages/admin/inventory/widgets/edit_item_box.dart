import 'package:flutter/material.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';

import '../../../../config/config.dart';

class ElevatedItemBox extends StatefulWidget {
  final Item item;

  const ElevatedItemBox({super.key, required this.item});

  @override
  State<ElevatedItemBox> createState() {
    return _ElevatedItemBoxState();
  }
}

class _ElevatedItemBoxState extends State<ElevatedItemBox> {
  late num counter = widget.item.count;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double boxWidth = 1500.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  child: TextFormField(
                    controller: widget.item.itemNameController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
                      hintText: widget.item.product?.itemName ?? "Add Text",
                      border: InputBorder.none,
                    ),
                  ),
                ),
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
                          "$counter",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SofiaPro'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    ElevatedButton(
                      onPressed: incrementCounter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: decrementCounter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shadowColor: orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            TextField(
              controller: widget.item.descriptionController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontFamily: 'SofiaPro'),
                hintText: widget.item.product?.itemDesc ?? "Add Desc",
                border: InputBorder.none,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  ProductController.create(
                    ProductModel(
                      itemName:
                          widget.item.itemNameController.text.toString().trim(),
                      itemDesc: widget.item.descriptionController.text
                          .toString()
                          .trim(),
                      category: "category",
                      price: 10,
                      quantity: counter,
                    ),
                  );
                  if (widget.item.product == null) {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  shape: const CircleBorder(),
                  minimumSize: const Size(55.0, 55.0),
                ),
                child: const Icon(
                  Icons.done,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
