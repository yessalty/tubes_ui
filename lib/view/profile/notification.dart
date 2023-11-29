import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Spacer(),
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.notifications),
                ],
              ),
              SizedBox(height: 20.0),
              buildNotificationCard(
                icon: Icons.notifications,
                text: 'Your car is ready to be picked up',
              ),
              // You can add more notification cards here as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNotificationCard({required IconData icon, required String text}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}