import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/theme_colors.dart';
import 'package:my_app/screens/consultations_screen.dart';
import 'package:my_app/screens/hospital_screen.dart';

class AppIndexScreen extends StatefulWidget {
  static const routeName = '/';

  const AppIndexScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AppIndexScreen> createState() => _AppIndexScreenState();
}

class _AppIndexScreenState extends State<AppIndexScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 1;
  List<Widget> _widgetOptions = [];
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const HospitalScreen(),
      const ConsultationsScreen(),
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
        backgroundColor: ThemeColor.grey,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _widgetOptions,
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: ThemeColor.grey,
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
          initialActiveIndex: 1, //optional, default as 1
          onTap: _onItemTapped,
        ));
  }
}
