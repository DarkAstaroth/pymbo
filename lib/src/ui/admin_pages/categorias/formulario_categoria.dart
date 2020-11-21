import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_event.dart';

class FormularioCategoria extends StatefulWidget {
  @override
  _FormularioCategoriaState createState() => _FormularioCategoriaState();
}

class _FormularioCategoriaState extends State<FormularioCategoria> {
  String nombreCategoria;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Crear categoria",
              style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
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
                labelText: 'Nombre de categoria',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  nombreCategoria = value;
                });
              },
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
                onPressed: () {
                  BlocProvider.of<CategoriaBloc>(context).add(AddCategoria(
                    nombreCategoria
                  ));
                  Navigator.pop(context);
                },
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
}
