import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_negocio/perfil_negocio.dart';

class UserCardNegocio extends StatelessWidget {
  final String portadaImage;
  final String nombre;
  final String email;
  final Negocio negocioData;

  const UserCardNegocio(this.portadaImage, this.nombre, this.email, this.negocioData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0.5),
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 70,
                    height: 70,
                    color: Colors.white,
                    child: ClipRRect(
                        child: FadeInImage(
                            placeholder: AssetImage('assets/img/load-app.gif'),
                            image: NetworkImage(portadaImage)))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nombre,
                          style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                        ),
                        Text(
                          email,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontFamily: 'GilroyL', fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Color(0XFFE63946),
                    ),
                    onSelected: (result) {
                      if (result == '1') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerfilNegocio(negocio:negocioData,)),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              value: '1',
                              height: 25,
                              child: Text(
                                "Ver",
                                style: TextStyle(
                                    fontFamily: 'GilroyB', fontSize: 13),
                              )),
                          PopupMenuItem(
                              height: 25,
                              child: Text(
                                "Editar",
                                style: TextStyle(
                                    fontFamily: 'GilroyB', fontSize: 13),
                              )),
                          PopupMenuItem(
                              height: 25,
                              child: Text(
                                "Eliminar",
                                style: TextStyle(
                                    fontFamily: 'GilroyB', fontSize: 13),
                              )),
                        ])
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
