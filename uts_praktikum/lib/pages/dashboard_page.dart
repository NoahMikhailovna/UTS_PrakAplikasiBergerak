import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'widget_bertingkat_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'navigasi_sederhana_page.dart';
import 'grid_view_page.dart';
import 'tentang_saya_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Track which buttons have been clicked
  final Set<int> _clickedButtons = {};

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Counter', 'index': 0},
    {'title': 'Widget Bertingkat', 'index': 1},
    {'title': 'User Input Example', 'index': 2},
    {'title': 'Dynamic List Example', 'index': 3},
    {'title': 'Navigasi Sederhana', 'index': 4},
    {'title': 'Grid View', 'index': 5},
    {'title': 'Tentang Saya', 'index': 6},
  ];

  void _navigateTo(BuildContext context, int index) {
    setState(() {
      _clickedButtons.add(index);
    });

    Widget page;
    switch (index) {
      case 0:
        page = const CounterPage();
        break;
      case 1:
        page = const WidgetBertingkatPage();
        break;
      case 2:
        page = const UserInputPage();
        break;
      case 3:
        page = const DynamicListPage();
        break;
      case 4:
        page = const NavigasiSederhanaPage();
        break;
      case 5:
        page = const GridViewPage();
        break;
      case 6:
        page = const TentangSayaPage();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPorto',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue[700],
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cek hasil karyaku disini:',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _menuItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, i) {
                  final item = _menuItems[i];
                  final int idx = item['index'];
                  final bool isClicked = _clickedButtons.contains(idx);

                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _navigateTo(context, idx),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isClicked ? Colors.lightBlue[400] : Colors.grey[300],
                        foregroundColor:
                            isClicked ? Colors.white : Colors.black87,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        item['title'],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
