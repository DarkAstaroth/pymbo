import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_state.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/models/producto_model.dart';
import 'package:pymbo/src/ui/perfil_producto/crear_producto.dart';
import 'package:pymbo/src/ui/perfil_producto/producto_admin_card.dart';

class PerfilProducto extends StatefulWidget {
  final Negocio negocio;

  const PerfilProducto({Key key, @required this.negocio}) : super(key: key);
  @override
  _PerfilProductoState createState() => _PerfilProductoState();
}

class _PerfilProductoState extends State<PerfilProducto> {
  List<Producto> productoList = [];

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
                  builder: (context) => CrearProducto(negocio: widget.negocio)),
            );
          }),
      backgroundColor: Color(0XFFF1FAEE),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(
              "Productos",
              textAlign: TextAlign.left,
              style: TextStyle(fontFamily: 'GilroyB', fontSize: 22),
            ),
          ),
          BlocBuilder<ProductoBloc, ProductoState>(builder: (context, state) {
            if (state is ProductoLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductoNoLoaded) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductoLoaded) {
              for (var i = 0; i < state.productos.length; i++) {
                if (state.productos[i].idNegocio == widget.negocio.id) {
                  productoList.add(state.productos[i]);
                }
              }

              return productoList.length == 0
                  ? Center(
                      child: Text("No hay productos disponibles"),
                    )

              : Expanded(child: ListView.builder(
                  itemCount: productoList.length,
                  itemBuilder: (_, int index) {
                    return ProductoAdminCard(
                      idProducto: productoList[index].idProducto,
                      nombre: productoList[index].nombreProducto,
                      imagenProducto : productoList[index].fotoProducto,
                      desc : productoList[index].descCorta
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
