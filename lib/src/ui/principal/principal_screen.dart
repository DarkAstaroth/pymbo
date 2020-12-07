import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_state.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/anuncio_model.dart';
import 'package:pymbo/src/models/negocio_model.dart';
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
  bool headers = true;
  List<dynamic> images = [
    NetworkImage(
        'https://firebasestorage.googleapis.com/v0/b/pymbo-4e8d4.appspot.com/o/BannerHome%2Fslide1.jpg?alt=media&token=af7bf6ca-58f7-4f97-9e74-8360234eaf7f'),
    NetworkImage(
        'https://firebasestorage.googleapis.com/v0/b/pymbo-4e8d4.appspot.com/o/BannerHome%2Fslide2.jpg?alt=media&token=7567cbbe-a159-4b69-a0cd-6b64b6a67bbf'),
    NetworkImage(
        'https://firebasestorage.googleapis.com/v0/b/pymbo-4e8d4.appspot.com/o/BannerHome%2Fslide3.jpg?alt=media&token=3478257a-cde5-4503-a330-5ea2e39df6c5')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.initialize(ams.getAppId());
  }

  @override
  Widget build(BuildContext context) {
    List<Anuncio> anuncioList = [];


    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              height: 180,
              child: swiperBanner(context),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: BlocBuilder<AnuncioBloc, AnuncioState>(
                        builder: (context, state) {
                      if (state is AnuncioLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is AnuncioNoLoaded) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is AnuncioLoaded) {
                        anuncioList = state.anuncios;

                        return ListView.builder(
                            itemCount: anuncioList.length,
                            itemBuilder: (_, int index) {
                              return Column(
                                children: [
                                  index == 0 ? getHeaders() : Container(),
                                  CardNegocioWidget(
                                      fotoAnuncio:
                                          anuncioList[index].fotoAnuncio,
                                      descLarga: anuncioList[index].desclarga)
                                ],
                              );
                            });
                      }
                    })))
          ],
        ));
  }

  Widget swiperBanner(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRect(
          child: FadeInImage(
            placeholder: AssetImage('assets/img/load-app-render.gif'),
            image: images[index],
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

  Widget getHeaders() {
    //headers = false;

    return Column(
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
      ],
    );
  }
}
