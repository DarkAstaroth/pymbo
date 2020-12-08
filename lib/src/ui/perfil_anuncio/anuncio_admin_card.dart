import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_event.dart';
import 'package:pymbo/src/ui/perfil_anuncio/crear_anuncio.dart';

class AnuncioAdminCard extends StatelessWidget {
  final String idAnuncio;
  final String fotoAnuncio;
  final String descCorta;
  final String descLarga;
  final String fechaInicio;
  final String fechaFin;

  const AnuncioAdminCard({Key key, this.idAnuncio, this.fotoAnuncio, this.descCorta, this.descLarga, this.fechaInicio, this.fechaFin}) : super(key: key);


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
              width: 120,
              height: 120,
              child: ClipRRect(
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage("assets/img/load-app.gif"),
                    image: NetworkImage(fotoAnuncio)),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        //"Elit in veniam laboris reprehenderit duis sit sit. Magna exercitation excepteur cupidatat magna irure sit voluptate ut dolore anim eu Lorem mollit. Ad sit do in nostrud do reprehenderit nulla. Irure et deserunt nisi excepteur tempor do minim. Nisi velit duis incididunt minim reprehenderit esse exercitation consequat. Deserunt sint duis deserunt duis commodo veniam tempor reprehenderit laboris est ipsum esse ullamco Lorem. Mollit enim cillum sint ut deserunt cupidatat in.",
                        descLarga,
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
                onSelected: (result) {
                  if (result == '1') {}
                  if (result == '2') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CrearAnuncio(
                                idAnuncio: idAnuncio,
                                fotoAnuncio: fotoAnuncio,
                                descCorta: descCorta,
                                descLarga: descLarga,
                                fechaInicio: fechaInicio,
                                fechaFin: fechaFin,
                                isUpdate: true,
                              )),
                    );
                  }
                  if (result == '3') {
                    _showMessage(context, "Anuncio eliminado con exito!",
                        Color(0XFFE63946));
                    BlocProvider.of<AnuncioBloc>(context)
                        .add(AnuncioDeleted(idAnuncio));
                  }
                },
                itemBuilder: (context) => [
                      // PopupMenuItem(
                      //     value: '1',
                      //     height: 25,
                      //     child: Text(
                      //       "Ver",
                      //       style:
                      //           TextStyle(fontFamily: 'GilroyB', fontSize: 13),
                      //     )),
                      PopupMenuItem(
                          value: "2",
                          height: 25,
                          child: Text(
                            "Editar",
                            style:
                                TextStyle(fontFamily: 'GilroyB', fontSize: 13),
                          )),
                      PopupMenuItem(
                          value: "3",
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

  void _showMessage(BuildContext context, String mensaje, Color color) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: color,
          position: FlashPosition.bottom,
          controller: controller,
          style: FlashStyle.floating,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: Text(
              mensaje,
              style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
            ),
          ),
        );
      },
    );
  }
}
