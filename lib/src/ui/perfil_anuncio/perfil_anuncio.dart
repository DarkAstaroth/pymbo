import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_state.dart';
import 'package:pymbo/src/models/anuncio_model.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_anuncio/anuncio_admin_card.dart';
import 'package:pymbo/src/ui/perfil_anuncio/crear_anuncio.dart';

class PerfilAnuncio extends StatefulWidget {
  final Negocio negocio;

  const PerfilAnuncio({Key key, @required this.negocio}) : super(key: key);
  @override
  _PerfilAnuncioState createState() => _PerfilAnuncioState();
}

class _PerfilAnuncioState extends State<PerfilAnuncio> {

  List<Anuncio> anuncioList = [];

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
                  builder: (context) => CrearAnuncio(negocio: widget.negocio)),
            );
          }),
      backgroundColor: Color(0XFFF1FAEE),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              "Anuncios",
              style: TextStyle(fontFamily: 'GilroyB', fontSize: 22),
            ),
          ),
            BlocBuilder<AnuncioBloc, AnuncioState>(
              builder: (context, state) {
            if (state is AnuncioLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AnuncioNoLoaded) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AnuncioLoaded) {
              anuncioList = [];
              for (var i = 0; i < state.anuncios.length; i++) {
                if (state.anuncios[i].idNegocio == widget.negocio.id) {
                  anuncioList.add(state.anuncios[i]);
                }
              }
              return anuncioList.length == 0
                  ? Center(
                      child: Text("No hay Anuncios disponibles"),
                    )

              : Expanded(
                child: ListView.builder(
                  itemCount: anuncioList.length,
                  itemBuilder: (_, int index) {
                    return AnuncioAdminCard(
                      idAnuncio: anuncioList[index].idAnuncio,
                      descLarga: anuncioList[index].desclarga,
                      fotoAnuncio : anuncioList[index].fotoAnuncio,
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
