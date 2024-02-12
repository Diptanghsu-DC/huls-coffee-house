import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/utils/formatter.dart';
import 'package:huls_coffee_house/utils/screen_size.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final Function refresh;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.refresh,
  });

  @override
  Widget build(context) {
    getSize(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.045,
                  fontFamily: "SofiaPro",
                ),
              ),
              Text(
                notification.message,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: width * 0.04,
                  fontFamily: "SofiaPro",
                ),
              ),
              Text(
                Formatter.dateTime(notification.time),
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: width * 0.04,
                  fontFamily: "SofiaPro",
                ),
              ),
              Visibility(
                visible: !UserController.currentUser!.isSeller,
                child: CustomButton(
                  onPressed: () {
                    showLoadingOverlay(
                      context: context,
                      asyncTask: () async {
                        final admin = await UserController.getAdmin();
                        await NotificationController.deleteNotification(
                          NotificationModel(
                            title: notification.title,
                            message: notification.message,
                            sender: admin.email,
                            receiver: UserController.currentUser!.email,
                            product: notification.product,
                            time: DateTime.now(),
                          ),
                        );
                      },
                      onCompleted: () {
                        refresh();
                      },
                    );
                  },
                  text: "Clear",
                ),
              ),
            ].separate(10),
          ),
        ),
      ),
    );
  }
}
