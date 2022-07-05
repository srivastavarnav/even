import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/constants/theme_colors.dart';
import 'package:my_app/locator.dart';
import 'package:my_app/services/navigation.dart';

const menu = <Map<String, String>>[
  {'id': '0', 'name': 'Tele-Consultation'},
  {'id': '1', 'name': 'Consultation'},
  {'id': '2', 'name': 'Lab Tests'},
  {'id': '3', 'name': 'Diagnostics'},
  {'id': '4', 'name': 'Health Checkup'},
];

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final NavigationService _navigationService = locator<NavigationService>();

  bool _setLayout = false;
  double turns = 0.0;
  String? _selectedId;
  List<Map<String, String>> _items = [];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  Future<void> _loadItems() async {
    for (dynamic item in menu) {
      await Future.delayed(const Duration(milliseconds: 300));
      _items.add(item);
      listKey.currentState?.insertItem(_items.length - 1);
    }
  }

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        _setLayout = true;
      });
      _changeRotation();
      _loadItems();
    });
  }

  void _changeRotation() {
    setState(() => turns += 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          color: _setLayout ? ThemeColor.grey : ThemeColor.blue,
          duration: const Duration(seconds: 1),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 32.0,
                child: AnimatedOpacity(
                  opacity: _setLayout ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    'Choose Type of Service',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 32.0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _setLayout ? 1.0 : 0.0,
                  child: AnimatedRotation(
                    duration: const Duration(milliseconds: 1000),
                    turns: turns,
                    child: InkWell(
                      onTap: () {
                        _navigationService.pop();
                      },
                      child: const Icon(
                        Icons.close,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 600),
                  bottom: _selectedId != null ? 32.0 : -100.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          ThemeColor.blue,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _setLayout ? 1.0 : 0.0,
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 500.0),
                      child: AnimatedList(
                        shrinkWrap: true,
                        key: listKey,
                        initialItemCount: _items.length,
                        itemBuilder: (context, index, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: const Offset(0, 0),
                            ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeIn,
                                reverseCurve: Curves.easeIn)),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedId = _items[index]['id'];
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 32.0, left: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AnimatedOpacity(
                                          duration:
                                              const Duration(milliseconds: 800),
                                          opacity:
                                              _selectedId == _items[index]['id']
                                                  ? 1.0
                                                  : 0.0,
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ThemeColor.blue,
                                                ),
                                                width: 6,
                                                height: 6,
                                              ),
                                              const SizedBox(
                                                width: 8.0,
                                              )
                                            ],
                                          ),
                                        ),
                                        Text(
                                          _items.isNotEmpty
                                              ? _items[index]['name']!
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      opacity:
                                          _selectedId == _items[index]['id']
                                              ? 1.0
                                              : 0.0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 32.0),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.grey[700],
                                          size: 24,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
}
