import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CardSearch extends StatefulWidget {
  final List<Negocio> negocios;
  CardSearch({Key key, this.negocios}) : super(key: key);

  @override
  _CardSearchState createState() => _CardSearchState();
}

class _CardSearchState extends State<CardSearch> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                    ),
                    child: ClipRRect(
                      child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder:
                              AssetImage("assets/img/load-app-render.gif"),
                          image: NetworkImage(
                              widget.negocios[index].portadaImage)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 140),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(

                          //borderRadius: BorderRadius.circular(5),

                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle),
                      child: CircularProfileAvatar(
                      widget.negocios[index].profileImage,
                      //child: Image(image: AssetImage('assets/img/profile-img.jpg')),
                      radius: 80,
                      borderColor: Colors.white,
                      borderWidth: 4,
                    )
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    widget.negocios[index].nombre,
                    style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      widget.negocios[index].categoria,
                      style: TextStyle(fontFamily: 'GilroyL', fontSize: 10),
                    ),
                  ),
                  starsCards(),
                  Expanded(
                      child: Container(
                    //color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(top: 10, left: 10, right: 10),
                            child: RichText(
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'GilroyL',
                                        color: Colors.black),
                                    text:
                                        widget.negocios[index].descLarga))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  icon: Icon(Typicons.heart), onPressed: () {}),
                              IconButton(
                                  icon: Icon(Typicons.home_outline),
                                  onPressed: () {}),
                              IconButton(
                                  icon: Icon(Typicons.map), onPressed: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
                ],
              ))
            ],
          ),
        );
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      itemCount: widget.negocios.length,
      //pagination: new SwiperPagination(),
      autoplay: true,
      loop: true,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }

  Widget starsCards() {
    return Align(
      alignment: Alignment.center,
      child: SmoothStarRating(
        rating: 3.5,
        isReadOnly: true,
        size: 15,
        color: Color(0XFFFFC600),
        borderColor: Color(0XFFFFC600),
      ),
    );
  }
}
