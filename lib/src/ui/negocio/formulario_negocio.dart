import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_state.dart';
import 'package:pymbo/src/models/categoria_model.dart';
import 'package:pymbo/src/repository/categoria_repository.dart';
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
    String email,
    String lat,
    String lng);

class FormularioNegocio extends StatefulWidget {
  final File samplePoI;
  final File sampleProI;
  final OnSaveCallback onSaveCall;
  const FormularioNegocio(
      {Key key, this.samplePoI, this.onSaveCall, this.sampleProI})
      : super(key: key);

  static final kInitialPosition = LatLng(-16.4959955, -68.133416);
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
  String lat;
  String lng;
  List<Categoria> listCategorias;

  

  String valueCategoria = '';
  List<S2Choice<String>> optionsCategoria = [];

  String valueSubCategoria = '';
  List<S2Choice<String>> optionsSubCategoria = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    PickResult selectedPlace;

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
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
              textCapitalization: TextCapitalization.sentences,
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
              textCapitalization: TextCapitalization.sentences,
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
          BlocBuilder<CategoriaBloc, CategoriaState>(builder: (context, state) {
            if (state is CategoriaLoading) {
              return CircularProgressIndicator();
            }
            if (state is CategoriaNoLoaded) {
              return CircularProgressIndicator();
            }
            if (state is CategoriaLoaded) {
              listCategorias = state.categorias;
              return Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: SmartSelect.single(
                    choiceConfig: S2ChoiceConfig(
                        style: S2ChoiceStyle(
                            titleStyle: TextStyle(fontFamily: 'GilroyB'))),
                    title: 'Categoria',
                    placeholder: 'Elije una opcion',
                    value: valueCategoria,
                    choiceItems: getCategoriasSelect(listCategorias),
                    onChange: (states) {
                      setState(() {
                        optionsCategoria = [];
                        optionsSubCategoria = [];
                        valueCategoria = states.value;
                        categoria = valueCategoria;
                      });
                    },
                  ),
                ),
              );
            }
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
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
              textCapitalization: TextCapitalization.sentences,
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
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
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
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45,
              child: RaisedButton(
                color: lat == null ? Color(0XFF1D3557) : Colors.green,
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacePicker(
                        apiKey:
                            'AIzaSyBT8n7fuyXsn6Vjwfvc-mkOWzcgaeAUmMs', // Put YOUR OWN KEY here.
                        onPlacePicked: (result) {
                          selectedPlace = result;
                          lat = selectedPlace.geometry.location.lat.toString();
                          lng = selectedPlace.geometry.location.lng.toString();
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                        initialPosition: FormularioNegocio.kInitialPosition,
                        useCurrentLocation: true,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    lat == null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                          ),
                    Text(
                      lat == null
                          ? 'Seleccinar Mapa'
                          : 'Ubicacion seleccionada',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              minWidth: double.infinity,
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
      widget.onSaveCall(
          widget.samplePoI,
          widget.sampleProI,
          nombre,
          descCorta,
          descLarga,
          categoria,
          subCategoria,
          direccion,
          telefono,
          email,
          lat,
          lng);
      Navigator.pop(context,
          SnackBar(content: Text("Negocio Registrado ! Cargando datos")));
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

  List<S2Choice<String>> getCategoriasSelect(List<Categoria> listaCategorias) {
    for (var i = 0; i < listaCategorias.length; i++) {
      optionsCategoria.add(S2Choice<String>(
          value: listaCategorias[i].nombreCategoria.toString(),
          title: listaCategorias[i].nombreCategoria.toString()));
    }
    return optionsCategoria;
  }
}
