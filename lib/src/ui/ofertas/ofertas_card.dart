import 'package:flutter/material.dart';

class OfertasCard extends StatefulWidget {

  
  final String nombre;
  final String imagen;
  final String desc;
  final String precio;
  final String stock;

  const OfertasCard({Key key, this.nombre, this.imagen, this.desc, this.precio, this.stock}) : super(key: key);

  

  @override
  _OfertasCardState createState() => _OfertasCardState();
}

class _OfertasCardState extends State<OfertasCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/img/load-app.gif'), 
                image: NetworkImage(widget.imagen)),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     widget.nombre,
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                    ),
                    Text(
                      "Bs${widget.precio}",
                      style: TextStyle(
                          fontFamily: 'GilroyB',
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                  ],
                ),
                Text(
                  widget.desc,
                  style: TextStyle(fontFamily: 'Gilroyl', fontSize: 13),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.shopping_cart, size: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        widget.stock,
                        style: TextStyle(fontFamily: 'Gilroyl', fontSize: 12),
                      ),
                    )
                  ],
                ),


              ],
            ),
          ))
        ],
      ),
    );
  }
}
