import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

class MiNegocio extends StatefulWidget {
  @override
  _MiNegocioState createState() => _MiNegocioState();
}

class _MiNegocioState extends State<MiNegocio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      floatingActionButton: FloatingActionButton(
        child: Icon(Typicons.pencil),
        onPressed: (){}
        ),
    );
  }
}
