import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/admin/inventory/utils/item_class.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/confirm_delete.dart';
import 'package:huls_coffee_house/pages/admin/inventory/widgets/edit_item_box.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';
import 'package:huls_coffee_house/utils/utils.dart';

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

  late String imageUrl = widget.item.product!.imageURL.isEmpty
      ? defaultImage
      : widget.item.product!.imageURL;

  void editMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double boxWidth = 1500.0;
    getSize(context);
    return !isEditMode
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: boxWidth,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
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
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        // Placeholder for image
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.21),
                          child: imageUrl == defaultImage
                              ? Image.asset(
                                  imageUrl,
                                  fit: BoxFit.fill,
                                )
                              : CustomNetworkImage(
                                  url: imageUrl,
                                  height: height * 0.4,
                                  errorWidget: (BuildContext context, _, __) {
                                    return Image.asset(
                                      mediaImage,
                                      fit: BoxFit.cover,
                                      height: height * 0.4,
                                    );
                                  },
                                ),
                        ),
                        // child: const Center(
                        //   child: Icon(Icons.image, size: 50, color: Colors.grey),
                        // ),
                      ),
                      widget.item.product!.isPopular
                          ? Positioned(
                              top: 0,
                              right: 0,
                              child: Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: width * 0.08,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        widget.item.product!.itemName,
                        style: TextStyle(
                            fontFamily: 'SofiaPro',
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.06),
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SofiaPro',
                                  fontSize: width * 0.05,
                                ),
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
                    style: TextStyle(
                        fontFamily: 'SofiaPro', fontSize: width * 0.04),
                  ),
                  Text(
                    "price : Rs ${widget.item.product!.price}",
                    style: TextStyle(
                        fontFamily: 'SofiaPro', fontSize: width * 0.04),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: editMode,
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
                      ElevatedButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) =>
                              ConfirmDelProduct(product: widget.item.product),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'SofiaPro'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : ElevatedItemBox(
            item: Item(product: widget.item.product),
            editMode: editMode,
          );
  }
}
