import 'package:flutter/material.dart';
import 'package:my_app/widgets/carousel_image.dart';
import 'package:my_app/widgets/horizontal_list.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            HorizontalList(
              title: 'Hospitals near you',
              getWidget: (index) {
                return const CarouselImage(
                  containerAspectRatio: 0.8,
                );
              },
              viewportFraction: 0.8,
              carouselLength: 3,
              containerAspectRatio: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 32.0),
              child: Text(
                'Your medical concierge',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
