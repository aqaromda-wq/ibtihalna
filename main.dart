import 'package:flutter/material.dart';
void main() => runApp(const IbtihalnaApp());
class IbtihalnaApp extends StatelessWidget {
  const IbtihalnaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF8FDF9),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 20),
              const Center(child: Text('أبتهالنا', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)))),
              const Center(child: Text('رفيقة دربك إلى الله', style: TextStyle(color: Colors.black54))),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: const Column(children: [
                  Text('الصلاة القادمة'),
                  Text('المغرب - 06:30 PM', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ]),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.access_time, color: Color(0xFF1B4D3E)), Text('مواقيت الصلاة', style: TextStyle(fontSize: 11))])),
                  Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.explore, color: Color(0xFF1B4D3E)), Text('اتجاه القبلة', style: TextStyle(fontSize: 11))])),
                  Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.menu_book, color: Color(0xFF1B4D3E)), Text('القرآن', style: TextStyle(fontSize: 11))])),
                  Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.favorite, color: Color(0xFF1B4D3E)), Text('السبحة', style: TextStyle(fontSize: 11))])),
                  Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.mic, color: Color(0xFF1B4D3E)), Text('المؤذن', style: TextStyle(fontSize: 11))])),
                  Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.waving_hand, color: Color(0xFF1B4D3E)), Text('الأذكار', style: TextStyle(fontSize: 11))])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
