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
        appBar: AppBar(
          title: Text(
            "Mis favoritos",
            style: TextStyle(
                color: Color(0XFF1D3557), fontFamily: 'GilroyB', fontSize: 20),
          ),
          leading: IconButton(
              color: Color(0XFFE63946),
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          backgroundColor: Color(0XFFF1FAEE),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: listaFavoritos(items)))
          ],
        ));
  }

  Widget listaFavoritos(int items) {
    if (items == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/img/favorite-page.png"),
          Text(
            "No tienes favoritos",
            style: TextStyle(fontFamily: 'GilroyB'),
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
