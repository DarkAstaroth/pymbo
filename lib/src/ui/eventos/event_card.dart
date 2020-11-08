import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
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
                color: Colors.greenAccent,
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
                      "Titulo Evento",
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                    ),
                    Text(
                      "Gratis",
                      style: TextStyle(
                          fontFamily: 'GilroyB',
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                  ],
                ),
                Text(
                  "Descripcion",
                  style: TextStyle(fontFamily: 'Gilroyl', fontSize: 13),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.date_range, size: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        "10.05.2020",
                        style: TextStyle(fontFamily: 'Gilroyl', fontSize: 12),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.timer, size: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        "10.05.2020",
                        style: TextStyle(fontFamily: 'Gilroyl', fontSize: 12),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.pin_drop, size: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      child: Text(
                        "La Paz Bolivia",
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
