import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  final List<Widget> items;
  final double carouselWidth;
  final double carouselHeight;

  const CustomCarousel({
    Key? key,
    required this.items,
    required this.carouselWidth,
    required this.carouselHeight,
  }) : super(key: key);

  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.carouselWidth,
      height: widget.carouselHeight,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: widget.carouselWidth,
                height: widget.carouselHeight,
                child: widget.items[index],
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                if (currentPageIndex > 0) {
                  setState(() {
                    currentPageIndex--;
                  });
                }
              },
              child: const Icon(Icons.arrow_left),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: FloatingActionButton(
              onPressed: () {
                if (currentPageIndex < widget.items.length - 1) {
                  setState(() {
                    currentPageIndex++;
                  });
                }
              },
              child: const Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
