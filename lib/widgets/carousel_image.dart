import 'package:flutter/material.dart';
import 'package:my_app/constants/theme_colors.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({
    Key? key,
    this.onCardTap,
    this.carouselMargin = const EdgeInsets.only(left: 12.0),
    this.containerAspectRatio = 1,
    this.displayImage,
  }) : super(key: key);

  final void Function()? onCardTap;
  final EdgeInsetsGeometry carouselMargin;
  final double containerAspectRatio;
  final String? displayImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            margin: carouselMargin,
            child: AspectRatio(
              aspectRatio: containerAspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16.0),
                  image: displayImage != null
                      ? DecorationImage(
                          image: NetworkImage(
                            displayImage ?? '',
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
