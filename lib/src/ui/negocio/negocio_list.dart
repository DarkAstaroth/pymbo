import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/negocio/user_card_negocio.dart';


class NegocioList extends StatefulWidget {
  @override
  _NegocioListState createState() => _NegocioListState();
}

class _NegocioListState extends State<NegocioList> {

    List<Negocio> negocioList = [];
    
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NegocioBloc, NegocioState>(
              builder: (context, state) {
          if (state is NegocioLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          if (state is NegocioNoLoaded) {
            return Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.error),
                  Text("No se cargaron los datos")
                ],
              ),
            );
          }
          if (state is NegocioLoaded) {
            negocioList = state.negocios;
            return Container(
              child: negocioList.length == 0
                  ? Center(child: Text("No hay negocios disponibles"),)
                  : ListView.builder(
                    itemCount: negocioList.length,
                    itemBuilder: (_, int index) {
                    return UserCardNegocio(
                      // negocioList[index].image,
                      negocioList[index].nombre,
                      negocioList[index].email
                    );
                   },
                  ),
            );
          }
          return Container();
        }
        );
  }
}

