import 'package:flutter/material.dart';

class FormularioNegocio extends StatefulWidget {
  @override
  _FormularioNegocioState createState() => _FormularioNegocioState();
}

class _FormularioNegocioState extends State<FormularioNegocio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: TextStyle(fontFamily: 'GilroyB'),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1D3557), width: 2.0)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              labelText: 'Nombre del negocio',
              labelStyle:
                  TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
              //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
            ),
            keyboardType: TextInputType.emailAddress,
            autovalidate: true,
            autocorrect: true,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: TextStyle(fontFamily: 'GilroyL'),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1D3557), width: 2.0)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              labelText: 'Descripcion Corta',
              labelStyle:
                  TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
              //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
            ),
            keyboardType: TextInputType.emailAddress,
            autovalidate: true,
            autocorrect: true,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            maxLines: 5,
            style: TextStyle(fontFamily: 'GilroyL'),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF1D3557), width: 2.0)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              labelText: 'Descripcion larga',
              labelStyle:
                  TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
              //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
            ),
            keyboardType: TextInputType.emailAddress,
            autovalidate: true,
            autocorrect: true,
          ),
        ),
        
      ],
    );
  }
}
