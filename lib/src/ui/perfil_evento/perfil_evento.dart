import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_bloc.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_state.dart';
import 'package:pymbo/src/models/evento_model.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_evento/crear_evento.dart';
import 'package:pymbo/src/ui/perfil_evento/evento_admin_card.dart';

class PerfilEvento extends StatefulWidget {
    final Negocio negocio;

  const PerfilEvento({Key key, this.negocio}) : super(key: key);
  @override
  _PerfilEventoState createState() => _PerfilEventoState();
}

class _PerfilEventoState extends State<PerfilEvento> {

    List<Evento> eventoList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFFE63946),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CrearEvento(negocio: widget.negocio)),
            );
          }),
      backgroundColor: Color(0XFFF1FAEE),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              "Eventos",
              style: TextStyle(fontFamily: 'GilroyB', fontSize: 22),
            ),
          ),
            BlocBuilder<EventoBloc, EventoState>(builder: (context, state) {
            if (state is EventoLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is EventoNoLoaded) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is EventoLoaded) {
              for (var i = 0; i < state.eventos.length; i++) {
                if (state.eventos[i].idNegocio == widget.negocio.id) {
                  eventoList.add(state.eventos[i]);
                }
              }
              return eventoList.length == 0
                  ? Center(
                      child: Text("No hay Eventos disponibles"),
                    )

              : Expanded(child: ListView.builder(
                  itemCount: eventoList.length,
                  itemBuilder: (_, int index) {
                    return EventoAdminCard(
                      titulo: eventoList[index].tituloEvento,
                      fotoCartel : eventoList[index].fotoCartel,
                      desc : eventoList[index].desc
                      );
                  },
                )
              );
            }
          })

        ],
      ),
    );
  }
}
