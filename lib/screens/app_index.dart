import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/consultations_screen.dart';

class AppIndexScreen extends StatefulWidget {
  static const routeName = '/';

  const AppIndexScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppIndexScreen> createState() => _AppIndexScreenState();
}

class _AppIndexScreenState extends State<AppIndexScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Center(child: Text('Page 1')),
      ConsultationsScreen(),
      const Center(child: Text('Page 3')),
      const Center(child: Text('Page 4')),
    ];
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFFebedf4),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _widgetOptions,
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: const Color(0XFFebedf4),
          color: Colors.black,
          activeColor: Colors.black,
          items: const [
            TabItem(
              icon: Icons.home_outlined,
            ),
            TabItem(
              icon: Icons.history,
            ),
            TabItem(
              icon: Icons.spa,
            ),
            TabItem(
              icon: Icons.person,
            ),
          ],
          initialActiveIndex: 0, //optional, default as 0
          onTap: _onItemTapped,
        ));
  }
}
