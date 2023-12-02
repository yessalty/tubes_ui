import 'package:flutter/material.dart';
import 'package:tubes_ui/view/booking.dart';
import 'package:tubes_ui/view/home/openCar.dart';
import 'package:tubes_ui/view/profile/profile.dart';
import 'package:tubes_ui/view/profile/promo.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Center(
      child: BookPage(),
    ),
    Center(
      child: ProfilePage(),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String location = 'Yogyakarta';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Location',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              location,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/gojohh.jpg'),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  border: InputBorder.none,
                  suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Search logic using searchQuery
                    },
                    child: const Icon(Icons.search, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Discover the latest deals and updates',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PromoPage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/promo.jpeg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150,
                child: Center(
                  child: Text(
                    'PROMO',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      backgroundColor: const Color.fromARGB(255, 74, 73, 73)
                          .withOpacity(0.5),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular cars near you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpenCarPage()),
                );
              },
              child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 200,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(4)),
                      child: Image.asset(
                        'assets/images/car1.jpeg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'GR YARIS',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.settings_input_component, size: 18),
                              SizedBox(width: 4),
                              Text('A/T'),
                              SizedBox(width: 12),
                              Icon(Icons.people, size: 18),
                              SizedBox(width: 4),
                              Text('5'),
                              SizedBox(width: 12),
                              Icon(Icons.car_rental, size: 18),
                              SizedBox(width: 4),
                              Text('2'),
                              SizedBox(width: 12),
                              Icon(Icons.wb_sunny, size: 18),
                              SizedBox(width: 4),
                              Text('A/C'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Color.fromRGBO(127, 90, 240, 1),
                                  ),
                                  SizedBox(width: 4),
                                  Text('Instant Confirmation'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 18,
                                    color: Color.fromRGBO(127, 90, 240, 1),
                                  ),
                                  SizedBox(width: 4),
                                  Text('Yogyakarta'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Color.fromRGBO(127, 90, 240, 1),
                                  ),
                                  SizedBox(width: 4),
                                  Text('Free Cancellation'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Day/'),
                                  SizedBox(width: 4),
                                  Text(
                                    'Rp 500.000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(127, 90, 240, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
            const SizedBox(height: 20),
            Text(
              'Popular City',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/promo.jpeg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                child: const Center(
                  child: Text(
                    'YOGYAKARTA',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _widgetOptions,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
