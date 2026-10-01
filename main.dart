import 'package:flutter/material.dart';

void main() {
  runApp(const IbtihalnaApp());
}

class IbtihalnaApp extends StatelessWidget {
  const IbtihalnaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ابتهالنا',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Cairo',
      ),
      home: const SplashScreen(),
    );
  }
}

// 1. شاشة البداية (Splash Screen)
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B4F4C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.mosque, size: 90, color: Colors.amber),
            const SizedBox(height: 20),
            const Text(
              'ابتهالنا',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'Ibhtalna',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            const Text(
              'رفيقة دربك إلى الله',
              style: TextStyle(fontSize: 14, color: Colors.amberAccent),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. الشاشة الرئيسية (Home Screen)
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B4F4C),
        title: Row(
          children: const [
            Icon(Icons.mosque, color: Colors.amber),
            SizedBox(width: 8),
            Text('ابتهالنا', style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // بطاقة الصلاة القادمة
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0B4F4C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  Text('⏰ الصلاة القادمة', style: TextStyle(color: Colors.amberAccent, fontSize: 16)),
                  SizedBox(height: 8),
                  Text('المغرب', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('06:30 PM', style: TextStyle(color: Colors.white, fontSize: 20)),
                  Divider(color: Colors.white30),
                  Text('المؤذن الحالي: الشيخ عبد الباسط عبد الصمد', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // شبكة الأزرار الرئيسية
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildHomeCard(context, 'مواقيت الصلاة', Icons.access_time, const PrayerTimesScreen()),
                _buildHomeCard(context, 'اتجاه القبلة', Icons.explore, const QiblaScreen()),
                _buildHomeCard(context, 'القرآن الكريم', Icons.menu_book, const QuranScreen()),
                _buildHomeCard(context, 'السبحة الإلكترونية', Icons.radio_button_checked, const SebhaScreen()),
                _buildHomeCard(context, 'اختيار المؤذن', Icons.volume_up, const MuadhinScreen()),
                _buildHomeCard(context, 'الأذكار', Icons.book, const AzkarScreen()),
              ],
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'إشراف: إبتهال عماد عويس | تطوير: عماد عويس',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeCard(BuildContext context, String title, IconData icon, Widget targetScreen) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: const Color(0xFF0B4F4C)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

// 3. شاشة مواقيت الصلاة
class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prayers = [
      {'name': 'الفجر', 'time': '04:45 AM'},
      {'name': 'الشروق', 'time': '06:00 AM'},
      {'name': 'الظهر', 'time': '12:20 PM'},
      {'name': 'العصر', 'time': '03:45 PM'},
      {'name': 'المغرب', 'time': '06:30 PM'},
      {'name': 'العشاء', 'time': '07:50 PM'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('مواقيت الصلاة'), backgroundColor: const Color(0xFF0B4F4C)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.teal.shade50,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.teal),
                SizedBox(width: 8),
                Text('مكة المكرمة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ...prayers.map((prayer) => Card(
            child: ListTile(
              title: Text(prayer['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(prayer['time']!, style: const TextStyle(fontSize: 16, color: Colors.teal)),
            ),
          )),
        ],
      ),
    );
  }
}

// 4. شاشة اتجاه القبلة
class QiblaScreen extends StatelessWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اتجاه القبلة'), backgroundColor: const Color(0xFF0B4F4C)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.explore, size: 150, color: Color(0xFF0B4F4C)),
            SizedBox(height: 20),
            Text('الزاوية الحالية نحو الكعبة المشرفة', style: TextStyle(fontSize: 16)),
            Text('169°', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal)),
            SizedBox(height: 10),
            Text('موقعك الحالي: مكة المكرمة', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// 5. شاشة القرآن الكريم
class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final surahs = [
      {'number': '1', 'name': 'الفاتحة'},
      {'number': '2', 'name': 'البقرة'},
      {'number': '3', 'name': 'آل عمران'},
      {'number': '4', 'name': 'النساء'},
      {'number': '5', 'name': 'المائدة'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم'), backgroundColor: const Color(0xFF0B4F4C)),
      body: ListView.builder(
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.teal,
              child: Text(surahs[index]['number']!, style: const TextStyle(color: Colors.white)),
            ),
            title: Text(surahs[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          );
        },
      ),
    );
  }
}

// 6. شاشة السبحة الإلكترونية
class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 33;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('السبحة الإلكترونية'), backgroundColor: const Color(0xFF0B4F4C)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('سُبْحَانَ اللَّهِ وَبِحَمْدِهِ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0B4F4C))),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: CircularProgressIndicator(
                    value: (counter % 33) / 33,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                  ),
                ),
                Text('$counter', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal, padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
              onPressed: _incrementCounter,
              icon: const Icon(Icons.touch_app),
              label: const Text('تسبيح', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: _resetCounter,
              icon: const Icon(Icons.refresh, color: Colors.grey),
              label: const Text('إعادة ضبط', style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}

// 7. شاشة اختيار المؤذن
class MuadhinScreen extends StatelessWidget {
  const MuadhinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final muadhins = [
      'الشيخ عبد الباسط عبد الصمد',
      'الشيخ مشاري راشد العفاسي',
      'الشيخ عبد الرحمن السديس',
      'الشيخ ماهر المعقيلي',
      'الشيخ سعد الغامدي',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('اختيار المؤذن'), backgroundColor: const Color(0xFF0B4F4C)),
      body: ListView.builder(
        itemCount: muadhins.length,
        itemBuilder: (context, index) {
          return RadioListTile<int>(
            value: index,
            groupValue: 0,
            onChanged: (val) {},
            title: Text(muadhins[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            secondary: const Icon(Icons.person, color: Colors.teal),
          );
        },
      ),
    );
  }
}

// 8. شاشة الأذكار
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الأذكار'),
          backgroundColor: const Color(0xFF0B4F4C),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'الصباح'),
              Tab(text: 'المساء'),
              Tab(text: 'النوم'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAzkarList('أذكار الصباح', 'أصبحت وأصبح الملك لله...'),
            _buildAzkarList('أذكار المساء', 'أمسينا وأمسى الملك لله...'),
            _buildAzkarList('أذكار النوم', 'باسمك ربي وضعت جنبي...'),
          ],
        ),
      ),
    );
  }

  Widget _buildAzkarList(String title, String content) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal)),
                const Divider(),
                const SizedBox(height: 8),
                Text(content, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 9. شاشة الإعدادات
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات'), backgroundColor: const Color(0xFF0B4F4C)),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: Colors.teal),
            title: const Text('اللغة'),
            trailing: const Text('العربية', style: TextStyle(color: Colors.grey)),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.volume_up, color: Colors.teal),
            title: const Text('المؤذن الافتراضي'),
            subtitle: const Text('الشيخ عبد الباسط عبد الصمد'),
            onTap: () {},
          ),
          const Divider(),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode, color: Colors.teal),
            title: const Text('الوضع الداكن'),
            value: false,
            onChanged: (val) {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.teal),
            title: const Text('حول التطبيق'),
            subtitle: const Text('الإصدار 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
