import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huls_coffee_house/config/config.dart';
import 'package:huls_coffee_house/controllers/controllers.dart';
import 'package:huls_coffee_house/pages/about_us/about_us.dart';
import 'package:huls_coffee_house/pages/admin/inventory/inventory.dart';
import 'package:huls_coffee_house/pages/notifications_page/notifications_page.dart';
import 'package:huls_coffee_house/pages/privacy_policy/privacy_policy.dart';
import 'package:huls_coffee_house/pages/profile/profile_main.dart';

// import 'package:huls_coffee_house/pages/Sidemenu/sidemenilistclass.dart';
import 'package:huls_coffee_house/pages/sidemenu/sidemenucard.dart';
import 'package:huls_coffee_house/pages/login_ui/widgets/buttons.dart';
import 'package:huls_coffee_house/pages/pages.dart';
import 'package:huls_coffee_house/utils/logout_message.dart';

Widget buildCustomDrawer(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.06),
        InkWell(
          onTap: () => Navigator.pushNamed(context, ProfilePage.routeName),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.277,
                  height: height * 0.125,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 3,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/account.png',
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: width * 0.025),
        Padding(
          padding: EdgeInsets.only(left: width * 0.1),
          child: Text(
            // This function should be defined
            UserController.currentUser!.name,
            style: const TextStyle(
              color: Color(0xFF565656),
              fontSize: 20,
              fontFamily: 'SofiaPro',
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: height * 0.03875),
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.0388),
                child: Container(
                  width: 4,
                  color: const Color(0xFFE68969),
                ),
              ),
              !UserController.currentUser!.isSeller
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.036, right: width * 0.075),
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, AboutUsPage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.info,
                                title: 'About Us',
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, PrivacyPolicyPage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.lock,
                                title: 'Privacy Policy',
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, ProfilePage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.profile_circled,
                                title: 'Account',
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, CartPage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.cart,
                                title: 'Cart',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NotificationsPage.routeName);
                              },
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.bell,
                                title: 'Notifications',
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.036, right: width * 0.075),
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, AboutUsPage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.info,
                                title: 'About Us',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PrivacyPolicyPage.routeName);
                              },
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.lock,
                                title: 'Privacy Policy',
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, ProfilePage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.profile_circled,
                                title: 'Account',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Inventory.routeName);
                              },
                              child: const SideMenuCard(
                                iconname: Icons.inventory,
                                title: 'Inventory',
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, OrderPage.routeName),
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.timer,
                                title: 'Orders',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, NotificationsPage.routeName);
                              },
                              child: const SideMenuCard(
                                iconname: CupertinoIcons.bell,
                                title: 'Notifications',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height * 0.05, top: height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.5277,
                height: height * 0.05875,
                decoration: ShapeDecoration(
                  color: orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: CustomButton(
                  text: "SIGN OUT",
                  onPressed: () async {
                    if (await showLogoutWarning(context)) {
                      UserController.logOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginPage.routeName, (route) => false);
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
