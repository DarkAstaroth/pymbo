import 'package:flutter/material.dart';

class EventoAdminCard extends StatelessWidget {

  final String titulo;
  final String fotoCartel;
  final String desc;

  const EventoAdminCard({Key key, this.titulo, this.fotoCartel, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 120,
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
              width: 80,
              height: 120,
              color: Colors.green,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 15),
                    child: Text(
                      "",
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Elit in veniam laboris reprehenderit duis sit sit. Magna exercitation excepteur cupidatat magna irure sit voluptate ut dolore anim eu Lorem mollit. Ad sit do in nostrud do reprehenderit nulla. Irure et deserunt nisi excepteur tempor do minim. Nisi velit duis incididunt minim reprehenderit esse exercitation consequat. Deserunt sint duis deserunt duis commodo veniam tempor reprehenderit laboris est ipsum esse ullamco Lorem. Mollit enim cillum sint ut deserunt cupidatat in.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Color(0XFFE63946),
                ),
                itemBuilder: (context) => [
                      PopupMenuItem(
                          value: '1',
                          height: 25,
                          child: Text(
                            "Ver",
                            style:
                                TextStyle(fontFamily: 'GilroyB', fontSize: 13),
                          )),
                      PopupMenuItem(
                          height: 25,
                          child: Text(
                            "Editar",
                            style:
                                TextStyle(fontFamily: 'GilroyB', fontSize: 13),
                          )),
                      PopupMenuItem(
                          height: 25,
                          child: Text(
                            "Eliminar",
                            style:
                                TextStyle(fontFamily: 'GilroyB', fontSize: 13),
                          )),
                    ])
          ],
        ),
      ),
    );
  }
}
