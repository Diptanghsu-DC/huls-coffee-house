import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/models/models.dart';
import 'package:huls_coffee_house/pages/notifications_page/widgets/notification_card.dart';
import 'package:huls_coffee_house/pages/pages.dart';

class NotificationStream extends StatefulWidget {
  const NotificationStream({super.key});

  @override
  State<NotificationStream> createState() => _NotificationStreamState();
}

class _NotificationStreamState extends State<NotificationStream> {
  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: _refresh,
      child: StreamBuilder<List<NotificationModel>>(
        stream: NotificationController.get(
            receiver: UserController.currentUser!.email),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: orange,
              ),
            );
          } else {
            // Process the data from snapshot
            final notifications = snapshot.data!;

            if (notifications.isEmpty) {
              return const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.bell),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "No new notifications",
                      style: TextStyle(fontFamily: 'SofiaPro'),
                    )
                  ],
                ),
              );
            }
            notifications.sort((a, b) => b.time.compareTo(a.time));
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => UserController.currentUser!.isSeller
                    ? Navigator.pushNamed(context, OrderPage.routeName)
                    : null,
                child: NotificationCard(
                  notification: notifications[index],
                  refresh: _refresh,
                ),
              ),
              // ),
            );
          }
        },
      ),
    );
  }
}
