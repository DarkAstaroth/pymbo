import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_state.dart';
import 'package:pymbo/src/models/categoria_model.dart';

class CategoriaWidget extends StatelessWidget {

  List<Categoria> categoriaList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explorar por categorias',
                style: TextStyle(fontFamily: 'GilroyB'),
              ),
              Text(
                'Ver Todas',
                style: TextStyle(fontFamily: 'GilroyB'),
              )
            ],
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 10),
            child: BlocBuilder<CategoriaBloc, CategoriaState>(
                builder: (context, state) {
              if (state is CategoriaLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoriaNoLoaded) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoriaLoaded) {
                categoriaList =state.categorias;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:categoriaList.length ,
                  itemBuilder: (_,int index){
                    return categoriaItem(categoriaList[index].nombreCategoria);
                  }
                  );
              }
            }),
          ))
        ],
      ),
    );
  }

  Widget categoriaItem(String text) {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0XFF1D3557),
            ),
            width: 100,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(fontFamily: 'GilroyB', color: Colors.white),
                )
              ],
            )));
  }
}
