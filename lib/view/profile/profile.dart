import 'package:flutter/material.dart';
import 'package:tubes_ui/view/login/login.dart';
import 'package:tubes_ui/view/profile/contactUs.dart';
import 'package:tubes_ui/view/profile/friendList.dart';
import 'package:tubes_ui/view/profile/payment/payment.dart';
import 'package:tubes_ui/view/profile/editProfile.dart';
import 'package:tubes_ui/view/profile/notification.dart';
import 'package:tubes_ui/view/profile/promo.dart';
import 'package:tubes_ui/view/profile/settings/settings.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8.0),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Location',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Yogyakarta',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()),
                      );
                      },
                      child: const Icon(Icons.notifications),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/gojohh.jpg'),
              ),
              const SizedBox(height: 8.0),
              const Center(
                child: Text(
                  'Gojo Satoru',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                },
                child: const Center(
                  child: Text(
                    'View and Edit Profile',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildCard(
                    icon: Icons.bookmark,
                    title: 'BOOKMARKS',
                    onTap: () {
                      // Navigate to bookmarks page
                    },
                  ),
                  buildCard(
                    icon: Icons.qr_code,
                    title: 'SCAN QR',
                    onTap: () {
                      // Navigate to scan QR page
                    },
                  ),
                  buildCard(
                    icon: Icons.settings,
                    title: 'SETTINGS',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                  buildCard(
                    icon: Icons.history,
                    title: 'HISTORY',
                    onTap: () {
                      // Navigate to history page
                    },
                  ),
                  buildCard(
                    icon: Icons.payment,
                    title: 'PAYMENT',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentPage()),
                      );
                    },
                  ),
                  buildCard(
                    icon: Icons.bookmark,
                    title: 'PROMOS',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PromoPage()),
                      );
                    },
                  ),
                  buildCard(
                    icon: Icons.group,
                    title: 'FRIENDS LIST',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => FriendListPage()),
                      );
                    },
                  ),
                  buildCard(
                    icon: Icons.chat,
                    title: 'CONTACT US',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUsPage()),
                      );
                    },
                  ),
                  buildCard(
                    icon: Icons.exit_to_app,
                    title: 'SIGN OUT',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 4.0),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
