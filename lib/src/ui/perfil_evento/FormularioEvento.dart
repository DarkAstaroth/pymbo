import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_bloc.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_event.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class FormularioEvento extends StatefulWidget {
  final Negocio negocio;
  final File portadaImage;
  final File cartelimage;

  const FormularioEvento(
      {Key key, this.negocio, this.portadaImage, this.cartelimage})
      : super(key: key);

  @override
  _FormularioEventoState createState() => _FormularioEventoState();
}

class _FormularioEventoState extends State<FormularioEvento> {
  String titulo;
  String precio;
  String cupos;
  String desc;
  final format = DateFormat("yyyy-MM-dd HH:mm");

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
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyB'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Titulo Evento',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  titulo = value;
                });
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
                labelText: 'Precio',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  precio = value;
                });
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
                labelText: 'Cupos',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  cupos = value;
                });
              },
            ),
          ),
          //           Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: DateTimeField(
          //     decoration:InputDecoration(
          //       helperText: "Fecha Evento"
          //     ) ,
          //     format: format,
          //     onShowPicker: (context, currentValue) async {
          //       final date = await showDatePicker(
          //           context: context,
          //           firstDate: DateTime(1900),
          //           initialDate: currentValue ?? DateTime.now(),
          //           lastDate: DateTime(2100));
          //       if (date != null) {
          //         final time = await showTimePicker(
          //           context: context,
          //           initialTime:
          //               TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          //         );
          //         return DateTimeField.combine(date, time);
          //       } else {
          //         return currentValue;
          //       }
          //     },
          //   ),
          // ),
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
                labelText: 'Descripcion',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.text,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  desc = value;
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
                  BlocProvider.of<EventoBloc>(context).add(AddEvento(
                      widget.negocio.id,
                      titulo,
                      widget.portadaImage,
                      widget.cartelimage,
                      "hora",
                      "fechaInicio",
                      "fechaFin",
                      precio,
                      cupos,
                      "true",
                      desc));
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
