import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

typedef OnSaveCallback = Function(
    File portadaImage,
    File profileImage,
    String nombre,
    String descCorta,
    String descLarga,
    String categoria,
    String subCategoria,
    String direccion,
    String telefono,
    String email);

class FormularioNegocio extends StatefulWidget {
  final File samplePoI;
  final File sampleProI;
  final OnSaveCallback onSaveCall;
  const FormularioNegocio(
      {Key key, this.samplePoI, this.onSaveCall, this.sampleProI})
      : super(key: key);

  @override
  _FormularioNegocioState createState() => _FormularioNegocioState();
}

class _FormularioNegocioState extends State<FormularioNegocio> {
  String nombre;
  String descCorta;
  String descLarga;
  String categoria;
  String subCategoria;
  String direccion;
  String telefono;
  String email;

String value = 'flutter';
List<S2Choice<String>> options = [
  S2Choice<String>(value: 'ion', title: 'Ionic'),
  S2Choice<String>(value: 'flu', title: 'Flutter'),
  S2Choice<String>(value: 'rea', title: 'React Native'),
];

String value2 = 'flutter';
List<S2Choice<String>> options2 = [
  S2Choice<String>(value: 'ion', title: 'Ionic'),
  S2Choice<String>(value: 'flu', title: 'Flutter'),
  S2Choice<String>(value: 'rea', title: 'React Native'),
];

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
                labelText: 'Descripcion Corta',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onSaved: (value) {
                return descCorta = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 5,
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Descripcion larga',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onSaved: (value) {
                return descLarga = value;
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
          //       labelText: 'Categoria',
          //       labelStyle:
          //           TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
          //       //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
          //     ),
          //     keyboardType: TextInputType.emailAddress,
          //     autovalidate: true,
          //     autocorrect: true,
          //     onSaved: (value) {
          //       return categoria = value;
          //     },
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                )
              ),
              child: SmartSelect.single(
                choiceConfig: S2ChoiceConfig(
                  style: S2ChoiceStyle(
                    titleStyle: TextStyle(
                      fontFamily: 'GilroyB'
                    )
                  )
                ),
              title: 'Categoria',
              placeholder: 'Elije una opcion',
              value: value,
              choiceItems: options,
              onChange: (state) {
                setState(() {
                value = state.value;
                categoria = value;
                });
              },
              
            ),
            )
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1
                )
              ),
              child: SmartSelect.single(
                choiceConfig: S2ChoiceConfig(
                  style: S2ChoiceStyle(
                    titleStyle: TextStyle(
                      fontFamily: 'GilroyB'
                    )
                  )
                ),
              title: 'Sub - Categoria',
              placeholder: 'Elije una opcion',
              value: value2,
              choiceItems: options,
              onChange: (state) {
                setState(() {
                value2 = state.value;
                subCategoria = value2;
                });
              },
              
            ),
            )
          ),
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
                labelText: 'Direccion',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onSaved: (value) {
                return direccion = value;
              },
            ),
          ),
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
                labelText: 'Telefono',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onSaved: (value) {
                return telefono = value;
              },
            ),
          ),
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
      widget.onSaveCall(widget.samplePoI, widget.sampleProI, nombre, descCorta,
          descLarga, categoria, subCategoria, direccion, telefono, email);
      Navigator.pop(context,SnackBar(content: Text("Negocio Registrado ! Cargando datos")));
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
