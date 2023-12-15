import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';

Future<void> showLoadingOverlay(
    {required BuildContext context,
    ValueNotifier<bool>? isVisible,
    void Function()? onCompleted,
    Future Function()? asyncTask}) async {
  isVisible ??= ValueNotifier(true);
  if (asyncTask != null) {
    asyncTask().then((value) => isVisible!.value = false);
  }
  Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false,
      barrierColor: Colors.black12,
      pageBuilder: (context, _, __) {
        return ValueListenableBuilder<bool>(
            valueListenable: isVisible!,
            builder: (BuildContext context, visible, Widget? child) {
              if (!visible) {
                Navigator.pop(context);
              }
              return const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(color: orange),
                ),
              );
            });
      },
    ),
  ).then((value) {
    if (onCompleted != null) {
      onCompleted();
    }
  });
}
