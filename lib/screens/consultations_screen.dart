import 'package:flutter/material.dart';
import 'package:my_app/constants/theme_colors.dart';
import 'package:my_app/locator.dart';
import 'package:my_app/screens/add_screen.dart';
import 'package:my_app/services/navigation.dart';
import 'package:my_app/widgets/cosultation_card.dart';
import 'package:animations/animations.dart';

class ConsultationsScreen extends StatefulWidget {
  static const routeName = '/consultation';
  const ConsultationsScreen({Key? key}) : super(key: key);

  @override
  State<ConsultationsScreen> createState() => _ConsultationsScreenState();
}

class _ConsultationsScreenState extends State<ConsultationsScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    const circleFabBorder = CircleBorder();
    bool addClicked = false;

    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 135.0,
              left: 55.0,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width: 2,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: ThemeColor.blue,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ThemeColor.blue,
                        ThemeColor.grey,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Text(
                    'My History',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    children: [
                      OpenContainer(
                        openElevation: 0,
                        closedElevation: 0,
                        openBuilder: (context, closedContainer) {
                          addClicked = true;
                          return const AddScreen();
                        },
                        openColor: ThemeColor.blue,
                        transitionDuration: const Duration(milliseconds: 700),
                        onClosed: (success) {
                          setState(() {
                            addClicked = false;
                          });
                        },
                        closedShape: circleFabBorder,
                        closedColor: ThemeColor.grey,
                        closedBuilder: (context, openContainer) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 100),
                            reverseDuration: const Duration(milliseconds: 100),
                            switchInCurve: Curves.bounceIn,
                            child: addClicked
                                ? const Icon(
                                    Icons.circle,
                                    color: ThemeColor.blue,
                                    size: 60.0,
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: ThemeColor.blue,
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.add_circle,
                                      color: ThemeColor.blue,
                                      size: 60.0,
                                    ),
                                  ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      Text(
                        'Add consultation',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: ThemeColor.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                ConsultationCard(
                  headingBg: Colors.yellowAccent.shade100,
                ),
                ConsultationCard(
                  headingBg: Colors.redAccent.shade100,
                ),
                ConsultationCard(
                  headingBg: Colors.greenAccent.shade100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// class CircleTransitionPainter extends CustomPainter {
//   CircleTransitionPainter({
//     Color backgroundColor,
//     Color currentCircleColor,
//     this.transitionPercent = 0,
//   }): backgroundPaint = Paint()...color= backgroundColor ;

//   final Paint backgroundPaint;
//   final Paint currentCirclePaint;

//   @override
//   void paint(Canvas canvas, Size size) {}

//   @override
//   bool shouldRepaint(CircleTransitionPainter oldDelegate) => false;
//   @override
//   bool shouldRebuildSemantics(CircleTransitionPainter oldDelegate) => false;
// }
