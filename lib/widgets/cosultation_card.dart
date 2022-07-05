import 'package:flutter/material.dart';
import 'package:my_app/constants/theme_colors.dart';

class ConsultationCard extends StatelessWidget {
  const ConsultationCard({
    Key? key,
    this.headingBg,
  }) : super(key: key);

  final Color? headingBg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                Text(
                  '05:35 PM',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Today',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 8.0, bottom: 16.0),
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Positioned(
                          top: 10,
                          left: 5,
                          child: Container(
                            height: 15,
                            width: 80,
                            color: headingBg,
                          )),
                      Text(
                        'CONSULTATION',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/aster_logo.png',
                    width: 70.0,
                  )
                ],
              ),
              Text(
                'Dr. Jordan Henderson',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Aster RV, Multispeciality Hospital, JP Nagar, Bangalore',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 4.0),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    ThemeColor.blue,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    'UPLOAD DOCS',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Feedback',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Edit',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: ThemeColor.blue),
                  ),
                ],
              ),
              Text(
                'Every interaction with the hospital was great!',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
