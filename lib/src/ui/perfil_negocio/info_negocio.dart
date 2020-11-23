import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_negocio/mapa_perfil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class InfoNegocio extends StatefulWidget {
  final Negocio negocio;

  const InfoNegocio({Key key, @required this.negocio}) : super(key: key);
  @override
  _InfoNegocioState createState() => _InfoNegocioState();
}

class _InfoNegocioState extends State<InfoNegocio> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Stack(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage("assets/img/load-app-render.gif"),
                      image: NetworkImage(widget.negocio.portadaImage)),
                )),
            Container(
              width: double.infinity,
              height: 230,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: CircularProfileAvatar(
                      widget.negocio.profileImage,
                      //child: Image(image: AssetImage('assets/img/profile-img.jpg')),
                      radius: 80,
                      borderColor: Colors.white,
                      borderWidth: 4,
                    )),
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    widget.negocio.nombre,
                    style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                  ),
                  SmoothStarRating(
                    rating: 0,
                    isReadOnly: true,
                    size: 15,
                    color: Color(0XFFFFC600),
                    borderColor: Color(0XFFFFC600),
                  ),
                  Text(
                    widget.negocio.categoria,
                    style: TextStyle(fontFamily: 'GilroyL', fontSize: 12),
                  ),
                ],
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getNumbers("0", Icons.favorite),
                getNumbers("0", Icons.star),
                getNumbers("0", Icons.share),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: Text(
            "Sobre la empresa",
            style: TextStyle(
              fontFamily: 'GilroyB',
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: Text(
              "Et occaecat id nulla amet do duis duis magna elit labore duis eu.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'GilroyL'),
            )),
        Divider(),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: Text(
              "Ad nulla nulla qui excepteur do velit anim et do veniam mollit. Eu dolore veniam sit cillum est incididunt laboris qui do cupidatat. Non est in minim ut reprehenderit nulla. Excepteur occaecat eu anim amet adipisicing cupidatat. Sint veniam sunt exercitation anim.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'GilroyL'),
            )),
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: Text(
            "Datos de contacto",
            style: TextStyle(
              fontFamily: 'GilroyB',
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          child: Column(
            children: [
              getDatos(Icons.email, widget.negocio.email),
              Divider(),
              getDatos(Icons.phone, widget.negocio.telefono),
              Divider(),
              getDatos(Icons.pin_drop, widget.negocio.direccion),
              Divider(),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45,
              child: RaisedButton(
                color: Colors.green,
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapaPerfil(negocio: widget.negocio)));
                },
                child: Text(
                  'Ubicacion en el mapa',
                  style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
                ),
              ),
            )),
      ],
    );
  }

  Widget getNumbers(String number, IconData icono) {
    return Container(
      width: 70,
      height: 70,
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.all(9),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
            ),
            Icon(icono)
          ],
        ),
      ),
    );
  }

  Widget getDatos(IconData icono, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icono),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'GilroyL',
              fontSize: 15,
            ),
          ),
        ),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
