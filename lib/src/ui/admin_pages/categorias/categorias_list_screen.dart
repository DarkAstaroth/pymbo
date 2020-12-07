import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_event.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_state.dart';
import 'package:pymbo/src/models/categoria_model.dart';
import 'package:pymbo/src/ui/admin_pages/categorias/formulario_categoria.dart';

class CategoriaListScreen extends StatefulWidget {
  @override
  _CategoriaListScreenState createState() => _CategoriaListScreenState();
}

class _CategoriaListScreenState extends State<CategoriaListScreen> {
  List<Categoria> categoriaList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFF1FAEE),
        appBar: AppBar(
          title: Text(
            "Categorias app",
            style: TextStyle(color: Color(0XFF1D3557), fontFamily: 'GilroyB'),
          ),
          backgroundColor: Color(0XFFF1FAEE),
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0XFFE63946),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0XFF1D3557),
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return FormularioCategoria();
                  });
            }),
        body: BlocBuilder<CategoriaBloc, CategoriaState>(
            builder: (context, state) {
          if (state is CategoriaLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriaNoLoaded) {
            return Center(
              child: Column(
                children: <Widget>[
                  Icon(Icons.error),
                  Text("No se cargaron los datos")
                ],
              ),
            );
          }
          if (state is CategoriaLoaded) {
            categoriaList = state.categorias;
            return ListView.builder(
              itemCount: categoriaList.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                categoriaList[index].nombreCategoria,
                                style: TextStyle(
                                    fontFamily: 'GilroyB', fontSize: 15),
                              ),
                            )),
                        PopupMenuButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Color(0XFFE63946),
                            ),
                            onSelected: (result) {
                              if (result == '1') {
                                
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FormularioCategoria(
                                        id: categoriaList[index].id,
                                        nombreCategoria: categoriaList[index].nombreCategoria,
                                        isUpdate: true
                                      );
                                    });
                              }
                              if (result == '2') {
                                _showMessageDeleted();
                                BlocProvider.of<CategoriaBloc>(context).add(
                                    CategoriaDeleted(categoriaList[index].id));
                              }
                            },
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: "1",
                                      height: 25,
                                      child: Text(
                                        "Editar",
                                        style: TextStyle(
                                            fontFamily: 'GilroyB',
                                            fontSize: 13),
                                      )),
                                  PopupMenuItem(
                                    value: "2",
                                    height: 25,
                                    child: Text(
                                      "Eliminar",
                                      style: TextStyle(
                                          fontFamily: 'GilroyB', fontSize: 13),
                                    ),
                                  ),
                                ])
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }));
  }

  void _showMessageDeleted({
    Duration duration,
    flashStyle = FlashStyle.floating,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: Color(0XFFE63946),
          position: FlashPosition.bottom,
          controller: controller,
          style: flashStyle,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: Text(
              'Categoria Eliminada con exito',
              style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
            ),
          ),
        );
      },
    );
  }
}
