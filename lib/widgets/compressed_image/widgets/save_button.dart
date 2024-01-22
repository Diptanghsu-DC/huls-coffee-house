import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  final double cardWidth;
  final void Function() onPressed;
  const CustomSaveButton(
      {super.key, required this.cardWidth, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: cardWidth / 4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.zero,
              ),
            ),
        child: Text(
          'Save',
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}
