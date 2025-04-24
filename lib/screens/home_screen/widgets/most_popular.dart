import 'dart:async';

import 'package:flutter/material.dart';

class MostPopularWidget extends StatefulWidget {
  const MostPopularWidget({
    super.key,
  });

  @override
  _MostPopularWidgetState createState() => _MostPopularWidgetState();
}

class _MostPopularWidgetState extends State<MostPopularWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> advertisements = [
    'assets/images/azkar_sabah.jpg',
    'assets/images/azkar_msa.jpg',
    'assets/images/azkar_sabah.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(Duration(seconds: 7), (Timer timer) {
      if (_currentPage < advertisements.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (mounted) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: advertisements.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(0.5 * (1 - value))
                      ..translate(0.0, 50.0 * (1 - value), 0.0),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          advertisements[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
