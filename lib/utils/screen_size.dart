import 'package:flutter/material.dart';

Size size = 0 as Size;

void getSize(BuildContext context) {
  size = MediaQuery.of(context).size;
}

//screen size
double width = size.width;
double height = size.height;
