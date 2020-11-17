import 'package:flutter/material.dart';

class OfertasCard extends StatefulWidget {
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
            height: 150,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(5)),
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
                      "Producto 1",
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                    ),
                    Text(
                      "Precio",
                      style: TextStyle(
                          fontFamily: 'GilroyB',
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                  ],
                ),
                Text(
                  "Ipsum reprehenderit sit voluptate aliquip non laborum ullamco elit sint enim. Irure quis duis ",
                  style: TextStyle(fontFamily: 'Gilroyl', fontSize: 13),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.favorite, size: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        "20",
                        style: TextStyle(fontFamily: 'Gilroyl', fontSize: 12),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.message, size: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        "10",
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
