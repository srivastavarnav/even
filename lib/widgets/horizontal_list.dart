import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    Key? key,
    this.title,
    this.subtitle,
    this.onLabelIconClick,
    this.viewportFraction = 0.9,
    this.enableInfiniteScroll = true,
    this.titlePadding =
        const EdgeInsets.only(top: 32.0, left: 16.0, bottom: 16.0),
    this.isLoading = false,
    this.carouselLength = 0,
    this.activePage = 0,
    required this.getWidget,
    this.containerHeight,
    this.padEnds = false,
    this.containerAspectRatio = 1.4,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final void Function()? onLabelIconClick;
  final double viewportFraction;
  final bool enableInfiniteScroll;
  final EdgeInsetsGeometry titlePadding;
  final bool isLoading;
  final int carouselLength;
  final int activePage;
  final Widget Function(int) getWidget;
  final double? containerHeight;
  final bool padEnds;
  final double containerAspectRatio;

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  late PageController _pageController;
  late int _activePage;

  @override
  initState() {
    super.initState();
    _activePage = widget.activePage;
    _pageController = PageController(viewportFraction: widget.viewportFraction);
  }

  Widget getPageWrapper(Widget child) {
    if (widget.containerHeight != null) {
      final Widget wrapper = SizedBox(
        height: widget.containerHeight,
        width: MediaQuery.of(context).size.width,
        child: child,
      );
      return wrapper;
    } else {
      final Widget wrapper =
          AspectRatio(aspectRatio: widget.containerAspectRatio, child: child);
      return wrapper;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if ((widget.title != null && widget.title!.isNotEmpty) ||
            (widget.subtitle != null && widget.subtitle!.isNotEmpty))
          Padding(
            padding: widget.titlePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                      widget.title != null && widget.title!.isNotEmpty
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                  children: <Widget>[
                    if (widget.title != null && widget.title!.isNotEmpty)
                      Text(
                        widget.title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: Colors.black),
                      ),
                  ],
                ),
              ],
            ),
          ),
        if (widget.carouselLength > 0)
          Column(
            children: [
              getPageWrapper(
                PageView.builder(
                    padEnds: widget.padEnds,
                    itemCount: !widget.enableInfiniteScroll
                        ? widget.carouselLength
                        : null,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        _activePage = page % widget.carouselLength;
                      });
                    },
                    itemBuilder: (context, pagePosition) {
                      return widget.getWidget(pagePosition);
                    }),
              ),
            ],
          )
        else
          getPageWrapper(
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "No data available",
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
