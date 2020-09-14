import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

class CategoriaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
                'Ver Todas (36)',
                style: TextStyle(fontFamily: 'GilroyB'),
              )
            ],
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                
                categoriaItem('Restaurantes'),
                categoriaItem('Artistas'),
                categoriaItem('Salud'),
                categoriaItem('Ropa'),
                categoriaItem('Comestibles'),

              ],
            ),
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
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Typicons.cloud,color: Colors.white,),
            Text(text,style: TextStyle(
              fontFamily: 'GilroyB',
              color: Colors.white
            ),)
          ],
        )
      )
    );
  }
}