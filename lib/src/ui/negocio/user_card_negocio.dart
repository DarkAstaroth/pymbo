import 'dart:ui';

import 'package:flutter/material.dart';

class UserCardNegocio extends StatelessWidget {

  final String nombre;
  final String email;

  const UserCardNegocio(this.nombre, this.email, ) ;


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
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
                    color: Colors.green,
                    //child: Image.network(image),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nombre,
                            style:
                                TextStyle(fontFamily: 'GilroyB', fontSize: 20),
                          ),
                          Text(
                            email,
                            style:
                                TextStyle(fontFamily: 'GilroyL', fontSize: 10),
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
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                height: 25,
                                child: Text(
                              "Ver",
                              style: TextStyle(
                                fontFamily: 'GilroyB',
                                fontSize: 13
                                ),
                            )),
                            PopupMenuItem(
                              height: 25,
                                child: Text(
                              "Editar",
                              style: TextStyle(
                                fontFamily: 'GilroyB',
                                fontSize: 13
                                ),
                            )),
                            PopupMenuItem(
                              height: 25,
                                child: Text(
                              "Eliminar",
                              style: TextStyle(
                                fontFamily: 'GilroyB',
                                fontSize: 13
                                ),
                            )),
                          ])
                ],
              ),
            ),
          );
  }
}