import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

import 'negocio_list.dart';

class MiNegocio extends StatefulWidget {
  @override
  _MiNegocioState createState() => _MiNegocioState();
}

class _MiNegocioState extends State<MiNegocio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1FAEE),
      appBar: AppBar(
        title: Text(
          "Mis negocios",
          style: TextStyle(
            color: Color(0XFF1D3557),
            fontFamily: 'GilroyB'
          ),
          ),
        backgroundColor: Color(0XFFF1FAEE),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0XFF1D3557),
            ),
          onPressed: (){
            Navigator.pop(context);
          }
        ),
      ),
      body: NegocioList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed('/perfil-negocio');
        }
        ),
    );
  }
}
