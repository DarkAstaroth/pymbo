import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_state.dart';
import 'package:pymbo/src/models/producto_model.dart';
import 'package:pymbo/src/ui/eventos/event_card.dart';
import 'package:pymbo/src/ui/ofertas/ofertas_card.dart';

class OfertaScreen extends StatefulWidget {
  OfertaScreen({Key key}) : super(key: key);

  @override
  _OfertaScreenState createState() => _OfertaScreenState();
}

class _OfertaScreenState extends State<OfertaScreen> {
  List<Producto> productoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        body: SafeArea(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ofertas",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: 'GilroyB', fontSize: 25),
                      ),
                      IconButton(icon: Icon(Icons.search), onPressed: () {})
                    ],
                  ),
                )),
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
                productoList = state.productos;
                return productoList.length == 0
                    ? Expanded(
                        child: Center(
                          child: Text("No hay productos disponibles"),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: productoList.length,
                          itemBuilder: (_, int index) {
                            return OfertasCard(
                              nombre: productoList[index].nombreProducto,
                              imagen: productoList[index].fotoProducto,
                              desc: productoList[index].descLarga,
                              precio: productoList[index].precio,
                              stock: productoList[index].stock,
                            );
                          },
                        ),
                      );
              }
            })
          ],
        )));
  }
}
