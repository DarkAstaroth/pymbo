import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/ui/eventos/event_card.dart';
import 'package:pymbo/src/ui/ofertas/ofertas_card.dart';

class OfertaScreen extends StatefulWidget {
  OfertaScreen({Key key}) : super(key: key);

  @override
  _OfertaScreenState createState() => _OfertaScreenState();
}

class _OfertaScreenState extends State<OfertaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: SafeArea(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ofertas",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'GilroyB', fontSize: 25),
                      ),
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),
                )),
            Expanded(
              child: ListView(
                children: [
                  OfertasCard(),
                  Divider(),
                  OfertasCard(),
                  Divider(),
                  OfertasCard(),
                  Divider(),
                  OfertasCard(),
                  Divider(),
                  OfertasCard(),
                  Divider(),
                  OfertasCard(),
                ],
              ),
            )
          ],
        )));
  }
}
