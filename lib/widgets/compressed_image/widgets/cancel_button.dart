import 'package:flutter/material.dart';

class CustomCancelButton extends StatelessWidget {
  final double cardWidth;
  final void Function() onPressed;
  const CustomCancelButton(
      {super.key, required this.cardWidth, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: cardWidth / 4,
      child: OutlinedButton(
        onPressed: onPressed,
        style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
              padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.zero,
              ),
            ),
        child: Text(
          'Cancel',
          style:
              Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}
