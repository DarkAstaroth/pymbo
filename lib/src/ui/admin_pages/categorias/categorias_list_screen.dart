import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_bloc.dart';
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
          if (state is CategoriaNoLoaded) {}
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
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      height: 25,
                                      child: Text(
                                        "Editar",
                                        style: TextStyle(
                                            fontFamily: 'GilroyB',
                                            fontSize: 13),
                                      )),
                                  PopupMenuItem(
                                      height: 25,
                                      child: Text(
                                        "Eliminar",
                                        style: TextStyle(
                                            fontFamily: 'GilroyB',
                                            fontSize: 13),
                                      )),
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
}
