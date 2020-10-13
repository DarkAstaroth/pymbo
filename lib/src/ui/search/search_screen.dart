import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttericon/typicons_icons.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/search-image-app.jpg"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Stack(
                children: [
                  Column(
                    children: [
                      headerSearch(), 
                      swiperCards()],
                  ),
                ],
              ),
            )));
  }

  Widget headerSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "¿Que estas buscando?",
              style: TextStyle(
                  color: Colors.white, fontFamily: "GilroyB", fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              child: TextFormField(
                style: TextStyle(fontFamily: 'GilroyL'),
                decoration: InputDecoration(
                  hintText: "Buscar",
                  hintStyle: TextStyle(fontFamily: 'GilroyB'),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  suffixIcon: Icon(Typicons.search, color: Color(0xFF1D3557)),
                ),
                keyboardType: TextInputType.text,
                autovalidate: true,
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget swiperCards() {
    return Expanded(
        child: ListView(
      children: [
        Container(
          width: double.infinity,
          height: 400,
          //color: Colors.white,
          child: cardsSearch(),
        )
      ],
    ));
  }

  Widget cardsSearch() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/img/yuriña1.jpg"))),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 140),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/yuriña2.jpg")),
                          color: Colors.red,
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    "Yuriña",
                    style: TextStyle(
                      fontFamily: 'GilroyB',
                      fontSize: 20
                    ),
                    )
                ],
              )
            ],
          ),
        );
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemCount: 10,
      //pagination: new SwiperPagination(),
      autoplay: true,
      loop: true,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}
