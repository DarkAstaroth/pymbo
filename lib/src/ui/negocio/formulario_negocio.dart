import 'dart:io';

import 'package:flutter/material.dart';

typedef OnSaveCallback = Function(File image,String nombre,String descripcion);

class FormularioNegocio extends StatefulWidget {
  final File samplePoI;
  final OnSaveCallback onSaveCall;
  const FormularioNegocio({Key key, this.samplePoI, this.onSaveCall}) : super(key: key);

  @override
  _FormularioNegocioState createState() => _FormularioNegocioState();
}

class _FormularioNegocioState extends State<FormularioNegocio> {
  String nombre;
  String email;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(fontFamily: 'GilroyB'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Nombre del negocio',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onSaved: (value) {
                return nombre = value;
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     style: TextStyle(fontFamily: 'GilroyL'),
          //     decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color(0xFF1D3557), width: 2.0)),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0)),
          //       labelText: 'Descripcion Corta',
          //       labelStyle:
          //           TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
          //       //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
          //     ),
          //     keyboardType: TextInputType.emailAddress,
          //     autovalidate: true,
          //     autocorrect: true,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     maxLines: 5,
          //     style: TextStyle(fontFamily: 'GilroyL'),
          //     decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color(0xFF1D3557), width: 2.0)),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0)),
          //       labelText: 'Descripcion larga',
          //       labelStyle:
          //           TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
          //       //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
          //     ),
          //     keyboardType: TextInputType.emailAddress,
          //     autovalidate: true,
          //     autocorrect: true,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     style: TextStyle(fontFamily: 'GilroyL'),
          //     decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color(0xFF1D3557), width: 2.0)),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0)),
          //       labelText: 'Direccion',
          //       labelStyle:
          //           TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
          //       //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
          //     ),
          //     keyboardType: TextInputType.emailAddress,
          //     autovalidate: true,
          //     autocorrect: true,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     style: TextStyle(fontFamily: 'GilroyL'),
          //     decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color(0xFF1D3557), width: 2.0)),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0)),
          //       labelText: 'Email',
          //       labelStyle:
          //           TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
          //       //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
          //     ),
          //     keyboardType: TextInputType.emailAddress,
          //     autovalidate: true,
          //     autocorrect: true,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Email',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onSaved: (value) {
                return email = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              height: 45,
              child: RaisedButton(
                color: Color(0xFFE63946),
                elevation: 0,
                onPressed: uploadNegocio,
                child: Text(
                  'Guardar Cambios ',
                  style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void uploadNegocio() async {
    if (validateAndSave()) {
      widget.onSaveCall(widget.samplePoI,nombre,email);
      Navigator.pop(context);
    }
  }

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
