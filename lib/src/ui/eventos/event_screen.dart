import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/ui/eventos/event_card.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
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
                        "Eventos",
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
                  EventCard(),
                  Divider(),
                  EventCard(),
                  Divider(),
                  EventCard(),
                  Divider(),
                  EventCard(),
                  Divider(),
                  EventCard(),
                  Divider(),
                  EventCard(),
                ],
              ),
            )
          ],
        )));
  }
}
