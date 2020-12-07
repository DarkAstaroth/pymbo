import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final String fotoEvento;
  final String tituloEvento;
  final String desc;
  final String precio;

  const EventCard({Key key, this.fotoEvento, this.tituloEvento, this.desc, this.precio}) : super(key: key);
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
                borderRadius: BorderRadius.circular(5)),
            child: ClipRRect(
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/img/load-app.gif"), 
                image: NetworkImage(widget.fotoEvento)),
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
                      widget.tituloEvento,
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                    ),
                    Text(
                      "${widget.precio} Bs",
                      style: TextStyle(
                          fontFamily: 'GilroyB',
                          color: Colors.grey,
                          fontSize: 15),
                    ),
                  ],
                ),
                Text(
                  widget.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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
