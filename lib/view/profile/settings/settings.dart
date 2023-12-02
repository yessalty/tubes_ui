import 'package:flutter/material.dart';
import 'package:tubes_ui/view/profile/profile.dart';
import 'package:tubes_ui/view/profile/settings/language.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isMessageOn = true;
  bool isPushNotificationOn = true;
  bool isPromotionOn = false;
  bool isDarkThemeOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 40.0),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              buildToggleListTile(
                'Message',
                isMessageOn,
                (bool value) {
                  setState(() {
                    isMessageOn = value;
                  });
                },
              ),
              buildToggleListTile(
                'Push Notification',
                isPushNotificationOn,
                (bool value) {
                  setState(() {
                    isPushNotificationOn = value;
                  });
                },
              ),
              buildToggleListTile(
                'Promotion',
                isPromotionOn,
                (bool value) {
                  setState(() {
                    isPromotionOn = value;
                  });
                },
              ),
              buildToggleListTile(
                'Dark Theme',
                isDarkThemeOn,
                (bool value) {
                  setState(() {
                    isDarkThemeOn = value;
                  });
                  // Tambahkan logika untuk mengubah tema di sini
                },
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LanguagePage()),
                      );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'English',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'City',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Yogyakarta',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildToggleListTile(
      String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
