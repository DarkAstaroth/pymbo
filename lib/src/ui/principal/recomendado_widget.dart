import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class RecomendadoWidget extends StatelessWidget {
  List<Negocio> negocioList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 150,
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recomendados',
                style: TextStyle(fontFamily: 'GilroyB'),
              ),
              Text(
                'Ver Todos',
                style: TextStyle(fontFamily: 'GilroyB'),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: BlocBuilder<NegocioBloc, NegocioState>(
                  builder: (context, state) {
                if (state is NegocioLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is NegocioNoLoaded) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is NegocioLoaded) {
                  negocioList = state.negocios;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: negocioList.length,
                      itemBuilder: (_, int index) {
                        return recomendadoItem(
                            negocioList[index].profileImage,
                            negocioList[index].nombre,
                            negocioList[index].descCorta,
                            negocioList[index].categoria);
                      });
                }
                //
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget recomendadoItem(String fotoPerfil, String nombre, String descCorta,String categoria) {
    return Padding(
      padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Container(
        height: double.infinity,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              // offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
                height: double.infinity,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  child: ClipRRect(
                    child: FadeInImage(
                      placeholder: AssetImage("assets/img/load-app.gif"), 
                      image: NetworkImage(fotoPerfil)),
                  )
                )),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nombre,
                    style: TextStyle(fontFamily: 'GilroyB', fontSize: 15),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star_border,
                        size: 10,
                        color: Color(0XFFFFC600),
                      )
                    ],
                  ),
                  Container(

                    height: 30,
                    child: Text( 
                    descCorta,
                    style: TextStyle(fontFamily: 'GilroyL', fontSize: 10),
                    maxLines:2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
