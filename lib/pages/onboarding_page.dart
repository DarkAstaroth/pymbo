import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pymbo/pages/slides_model.dart';
import 'package:pymbo/pages/widgets/slides_tile.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SlidesModel> slides = new List<SlidesModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrent ? 10.0 : 6.0,
      width: isCurrent ? 10.0 : 6.0,
      decoration: BoxDecoration(
          color: isCurrent ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemCount: slides.length,
        itemBuilder: (context, index) {
          return SlidesTile(
              imageAssetsPath: slides[index].imagePath,
              title: slides[index].imagePath,
              desc: slides[index].desc);
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
              height: Platform.isIOS ? 70 : 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(slides.length - 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text('SHIP'),
                  ),
                  Row(
                    children: <Widget>[
                      for (var i = 0; i < slides.length; i++)
                        currentIndex == i
                            ? pageIndexIndicator(true)
                            : pageIndexIndicator(false)
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(currentIndex + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    child: Text('NEXT'),
                  ),
                ],
              ),
            )
          : Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: Platform.isIOS ? 70 : 60,
              color: Colors.red,
              child: Text(
                "Comenzar",
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
