import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

import '../../../../config/config.dart';

class ElevatedItemBox extends StatefulWidget {
  final Item item;
  final Function? editMode;

  const ElevatedItemBox({
    super.key,
    required this.item,
    this.editMode,
  });

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
    getSize(context);
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
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.item.itemNameController,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                          fontFamily: 'SofiaPro', fontWeight: FontWeight.bold),
                      hintText: widget.item.product?.itemName == null
                          ? "Add Name"
                          : "Name : ${widget.item.product?.itemName}",
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
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SofiaPro',
                            fontSize: width * 0.05,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 17,
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
              ].separate(5),
            ),
            // const SizedBox(height: 4),
            TextField(
              controller: widget.item.descriptionController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontFamily: 'SofiaPro'),
                hintText: widget.item.product?.itemDesc == null
                    ? "Add Desc"
                    : "Desc : ${widget.item.product?.itemDesc}",
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: widget.item.categoryController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontFamily: 'SofiaPro'),
                hintText: widget.item.product?.category == null
                    ? "Add Category"
                    : "Category : ${widget.item.product?.category}",
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: widget.item.priceController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontFamily: 'SofiaPro'),
                hintText: widget.item.product?.price.toString() == null
                    ? "Price"
                    : "Price : ${widget.item.product?.price}",
                border: InputBorder.none,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () async {
                  await ProductController.create(
                    ProductModel(
                      itemName: widget.item.itemNameController.text
                                  .toString()
                                  .trim() ==
                              ""
                          ? widget.item.product!.itemName
                          : widget.item.itemNameController.text
                              .toString()
                              .trim(),
                      itemDesc: widget.item.descriptionController.text
                                  .toString()
                                  .trim() ==
                              ""
                          ? widget.item.product!.itemDesc
                          : widget.item.descriptionController.text
                              .toString()
                              .trim(),
                      category: widget.item.categoryController.text
                                  .toString()
                                  .trim() ==
                              ""
                          ? widget.item.product!.category
                          : widget.item.categoryController.text
                              .toString()
                              .trim(),
                      price:
                          widget.item.priceController.text.toString().trim() ==
                                  ""
                              ? widget.item.product!.price
                              : num.parse(
                                  widget.item.priceController.text.toString()),
                      quantity: counter,
                    ),
                  );
                  if (widget.item.product == null) {
                    Navigator.pop(context);
                  } else if (widget.editMode!() != null) {
                    widget.editMode!();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  shape: const CircleBorder(),
                  minimumSize: const Size(55.0, 55.0),
                ),
                child: Icon(
                  Icons.done,
                  size: width * 0.08,
                  color: Colors.white,
                ),
              ),
            ),
          ].separate(5),
        ),
      ),
    );
  }
}
