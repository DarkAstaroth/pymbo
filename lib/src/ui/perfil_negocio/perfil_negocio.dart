import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_negocio/info_negocio.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PerfilNegocio extends StatefulWidget {
  final Negocio negocio;

  const PerfilNegocio({Key key, @required this.negocio}) : super(key: key);

  @override
  _PerfilNegocioState createState() => _PerfilNegocioState();
}

class _PerfilNegocioState extends State<PerfilNegocio> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0XFF1D3557),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.volume_down)),
                  Tab(icon: Icon(Icons.calendar_today)),
                  Tab(icon: Icon(Icons.shopping_cart)),
                ]),
                title: Text(
                  widget.negocio.nombre,
                  style: TextStyle(fontFamily: 'GilroyB'),
                ),
              ),
              body: TabBarView(
                children: [
                  InfoNegocio(negocio: widget.negocio),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_bike),
                ],
              ))),
    );
  }
}
