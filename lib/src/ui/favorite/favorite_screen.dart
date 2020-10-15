import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final int items = 0;

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFFF1FAEE),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
              child: Text(
                "Mis favoritos",
                style: TextStyle(fontFamily: 'GilroyB', fontSize: 25),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: listaFavoritos(items)))
          ],
        )));
  }

  Widget listaFavoritos(int items) {
    if (items == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/img/favorite-page.png"),
          Text(
            "No tienes favoritos",
            style: TextStyle(
              fontFamily: 'GilroyB'
            ),
            )
        ],
      );
    } else {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Text("hay data");
        },
      );
    }
  }
}
