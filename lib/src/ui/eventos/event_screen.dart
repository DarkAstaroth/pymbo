import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_bloc.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_state.dart';
import 'package:pymbo/src/models/evento_model.dart';
import 'package:pymbo/src/ui/eventos/event_card.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<Evento> eventoList = [];
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
              child: BlocBuilder<EventoBloc,EventoState>(
                builder: (context,state){
                  if (state is EventoLoading) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (state is EventoNoLoaded) {
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if (state is EventoLoaded) {
                    eventoList = state.eventos;
                    return ListView.builder(
                      itemCount: eventoList.length,
                      itemBuilder: (BuildContext context, int index) {
                      return EventCard(
                        fotoEvento : eventoList[index].fotoCartel,
                        tituloEvento : eventoList[index].tituloEvento,
                        desc : eventoList[index].desc,
                        precio : eventoList[index].precio
                      );
                     },
                    );
                  }
              })
            )
          ],
        )));
  }
}
