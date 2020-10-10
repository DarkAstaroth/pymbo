import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pymbo/src/service/admod_service.dart';
import 'package:pymbo/src/ui/principal/banner_widget.dart';
import 'package:pymbo/src/ui/principal/card_negocio_widget.dart';
import 'package:pymbo/src/ui/principal/categoria_widget.dart';
import 'package:pymbo/src/ui/principal/recomendado_widget.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  final ams = AdmodService();

  List<dynamic> images =[
     AssetImage('assets/img/slide1.jpg'),
      AssetImage('assets/img/slide2.jpg'),
       AssetImage('assets/img/slide3.jpg'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.initialize(ams.getAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              height: 180,
              color: Colors.red,
              child: swiperBanner(context),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  CategoriaWidget(),
                  RecomendadoWidget(),
                  BannerWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Explora más negocios',
                    style: TextStyle(fontFamily: 'GilroyB'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CardNegocioWidget(),
                  CardNegocioWidget(),
                  CardNegocioWidget(),
                  CardNegocioWidget(),
                ],
              ),
            ))
          ],
        ));
  }

  Widget swiperBanner(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRect(
          child: FadeInImage(
            placeholder: AssetImage('assets/img/slide1.jpg'),
            image:images[index],
            fit: BoxFit.cover,
          ),
        );
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemCount: images.length,
      pagination: new SwiperPagination(),
      autoplay: true,
      loop: true,
    );
  }






  
}
