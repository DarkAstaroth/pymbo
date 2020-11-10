import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:pymbo/src/ui/negocio/formulario_negocio.dart';

class PerfilNegocio extends StatefulWidget {
  @override
  _PerfilNegocioState createState() => _PerfilNegocioState();
}

class _PerfilNegocioState extends State<PerfilNegocio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1D3557),
        title: Text(
          "Nuevo Negocio",
          style: TextStyle(
            fontFamily: 'GilroyB'
          ),
          ),
      ),
      backgroundColor: Color(0XFFF1FAEE),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.redAccent,
              ),
              Container(
                width: double.infinity,
                height: 230,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    child: CircularProfileAvatar(
                      '',
                      child: FlutterLogo(),
                      radius: 80,
                      borderColor: Color(0XFFFFFFFF),
                      borderWidth: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: FormularioNegocio(),
          )
        ],
      ),
    );
  }
}
