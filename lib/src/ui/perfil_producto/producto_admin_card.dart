import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_event.dart';
import 'package:pymbo/src/ui/perfil_producto/crear_producto.dart';

class ProductoAdminCard extends StatelessWidget {
  final String idProducto;
  final String nombre;
  final String imagenProducto;
  final String descCorta;
  final String descLarga;
  final String precio;
  final String stock;

  const ProductoAdminCard(
      {Key key,
      this.idProducto,
      this.nombre,
      this.imagenProducto,
      this.descCorta,
      this.descLarga,
      this.precio,
      this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 80,
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
              height: 80,
              child: ClipRRect(
                child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/img/load-app.gif'),
                    image: NetworkImage(imagenProducto)),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 7),
                    child: Text(
                      nombre,
                      style: TextStyle(fontFamily: 'GilroyB', fontSize: 18),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Text(
                        descCorta,
                        style: TextStyle(fontFamily: 'GilroyL'),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                          builder: (context) => CrearProducto(
                                idProducto: idProducto,
                                nombreProducto: nombre,
                                imagenProductoD: imagenProducto,
                                descCorta: descCorta,
                                descLarga: descLarga,
                                precio: precio,
                                stock: stock,
                                isUpdate: true,
                              )),
                    );
                  }
                  if (result == '3') {
                    _showMessage(context, "Categoria eliminada con exito!",
                        Color(0XFFE63946));
                    BlocProvider.of<ProductoBloc>(context)
                        .add(ProductoDeleted(idProducto));
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
