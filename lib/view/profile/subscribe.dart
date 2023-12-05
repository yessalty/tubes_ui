import 'package:flutter/material.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({Key? key}) : super(key: key);

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
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
                      Navigator.pop(context);
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
                color: Colors.grey), // Garis di antara harga dan deskripsi
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
                            color: Colors.green, // Warna ikon
                            size: 16, // Atur ukuran ikon sesuai kebutuhan
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
                
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(127, 90, 240, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}
