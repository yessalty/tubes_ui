import 'package:flutter/material.dart';
import 'package:tubes_ui/view/profile/subscribe/subscribe.dart';

class PaketPage extends StatefulWidget {
  const PaketPage({Key? key}) : super(key: key);

  @override
  State<PaketPage> createState() => _PaketPageState();
}

class _PaketPageState extends State<PaketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                        MaterialPageRoute(
                            builder: (context) => SubscribePage()),
                      );
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    'SUBSCRIBES',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 40.0),
                ],
              ),
              const SizedBox(height: 20),
              _buildSubscriptionCard(
                'Bronze',
                'Rp 100.000/bulan',
                'Layanan pelanggan standar\nDiskon 5% untuk setiap penyewaan',
                Icons.check,
              ),
              const SizedBox(height: 20),
              _buildSubscriptionCard(
                'Silver',
                'Rp 200.000/bulan',
                'Layanan pelanggan prioritas 24/7\nDiskon 10% untuk setiap penyewaan',
                Icons.check,
              ),
              const SizedBox(height: 20),
              _buildSubscriptionCard(
                'Gold',
                'Rp 300.000/bulan',
                'Layanan pelanggan VIP 24/7 dengan asisten pribadi\nDiskon 20% untuk setiap penyewaan\nAsuransi lengkap untuk keamanan tambahan',
                Icons.check, // atau ikon lainnya yang sesuai
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(
      String title, String price, String description, IconData iconData) {
    List<String> descriptionLines = description.split('\n');

    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                color: Colors.grey),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: descriptionLines
                  .map(
                    (line) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(
                            iconData,
                            color: Colors.green,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              line,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    double maxHeight =
                        MediaQuery.of(context).size.height * 0.65;

                    return Container(
                      constraints: BoxConstraints(
                        maxHeight: maxHeight,
                      ),
                      child: buildCombinedBottomSheet(
                          'BRONZE'),
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(127, 90, 240, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecCard(IconData icon, String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCombinedBottomSheet(String subscriptionType) {
    String subsName = '';
    String subsPrice = '';
    String description = '';

    switch (subscriptionType) {
      case 'Bronze':
        subsName = 'BRONZE';
        subsPrice = '100.000/bulan';
        break;
      case 'Silver':
        subsName = 'SILVER';
        subsPrice = '200.000/bulan';
        break;
      case 'Gold':
        subsName = 'GOLD';
        subsPrice = '300.000/bulan';
        break;
      default:
        subsName = 'BRONZE';
        subsPrice = '/bulan';
    }
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(127, 90, 240, 1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subsName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'subsPrice',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            // color: Colors.grey,
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: buildSpecCard(
                      Icons.calendar_today,
                      'Start',
                      'Select start date',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildSpecCard(
                      Icons.calendar_today,
                      'End',
                      'Select end date',
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 10),
              const Text(
                'Payment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              buildSpecCard(
                Icons.credit_card,
                'MasterCard',
                '**** **** 1234 5678',
              ),
              const SizedBox(height: 10),
              buildSpecCard(
                Icons.scanner,
                '',
                'SCAN QR',
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(127, 90, 240, 1),
                    ),
                    onPressed: () {
                      // Add functionality for Print PDF
                    },
                    child: const Text('Print PDF'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(127, 90, 240, 1),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SubscribePage()),
                      );
                    },
                    child: const Text('Beli'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
