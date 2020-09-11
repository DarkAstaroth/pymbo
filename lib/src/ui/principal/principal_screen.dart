import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  
  @override
  Widget build(BuildContext context) {
     FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              height: 200,
              color: Colors.red,
              child: swiperBanner(context),
            ),
            
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  categoriasWidget(),
                  recomendadoWidget(),
                  bannerWidget(),
                  Container(
                    height: 500,
                    color: Colors.green,
                  ),
                  Container(
                    height: 500,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 500,
                    color: Colors.green,
                  ),
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
          child: FadeInImage(placeholder: AssetImage('assets/img/slide1.jpg'), 
          image: AssetImage('assets/img/slide1.jpg'),
          fit: BoxFit.cover,
          ),
        );
      },
      indicatorLayout: PageIndicatorLayout.COLOR,

    
      itemCount: 1,
      pagination: new SwiperPagination(),

    );
  }

  Widget categoriasWidget() {
    return Container(
      // padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explorar por categorias',
                style: TextStyle(fontFamily: 'GilroyB'),
              ),
              Text('Ver Todas (36)')
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 100,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        color: Colors.red,
                      ),
                      Text('Categoria 1')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recomendadoWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 150,
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recomendados',
                style: TextStyle(fontFamily: 'GilroyB'),
              ),
              Text(
                'Ver Todos',
                style: TextStyle(fontFamily: 'GilroyB'),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Container(
                      height: double.infinity,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                            // offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5)),
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Negocio 1',
                                  style: TextStyle(
                                      fontFamily: 'GilroyB', fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    )
                                  ],
                                ),
                                Text(
                                  'categoria',
                                  style: TextStyle(
                                      fontFamily: 'GilroyL', fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: Container(
                      height: double.infinity,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 85,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Negocio 1',
                                  style: TextStyle(
                                      fontFamily: 'GilroyB', fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      size: 10,
                                      color: Color(0XFFFFC600),
                                    )
                                  ],
                                ),
                                Text(
                                  'categoria',
                                  style: TextStyle(
                                      fontFamily: 'GilroyL', fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bannerWidget() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0XFFA8DADC),
          ),
          height: 130,
          width: double.infinity,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
                child: Container(
              width: 200,
              child: Image(image: AssetImage('assets/img/banner1.png')),
            )),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anuncia',
                      style: TextStyle(fontFamily: 'GilroyL', fontSize: 12),
                    ),
                    Text(
                      'Tu Negocio',
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 22,color: Color(0XFF1D3557)),
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
