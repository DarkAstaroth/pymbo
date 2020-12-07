import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/search/card_search.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Negocio> negocioList=[];
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
          height: 420,
          //color: Colors.white,
          child: BlocBuilder<NegocioBloc,NegocioState>(
            builder: (context,state){
              if (state is NegocioLoading) {
                return Center(child: CircularProgressIndicator(),);
              }
              if (state is NegocioNoLoaded) {
                return Center(child: CircularProgressIndicator(),);
              }
              if (state is NegocioLoaded) {
                negocioList = state.negocios;
                return CardSearch(
                  negocios : negocioList,
                );
              }
            }
            )
        )
      ],
    )
    );
  }

}
