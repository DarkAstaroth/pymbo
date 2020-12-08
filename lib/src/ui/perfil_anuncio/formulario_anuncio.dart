import 'dart:io';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_event.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioAnuncio extends StatefulWidget {
  final Negocio negocio;
  final File imagenAnuncio;

  const FormularioAnuncio({Key key, this.negocio, this.imagenAnuncio})
      : super(key: key);

  @override
  _FormularioAnuncioState createState() => _FormularioAnuncioState();
}

class _FormularioAnuncioState extends State<FormularioAnuncio> {
  final format = DateFormat("dd-MM-yyyy");
  final formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController dateCtl2 = TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  TextEditingController timeCtl2 = TextEditingController();

  String descCorta;
  String descLarga;
  String fechaInicio;
  String fechaFin;
  String horaInicio;
  String horaFin;

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
                labelText: 'Descripcion Corta',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  descCorta = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              maxLines: 15,
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
              keyboardType: TextInputType.text,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  descLarga = value;
                });
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     textCapitalization: TextCapitalization.sentences,
          //     style: TextStyle(fontFamily: 'GilroyL'),
          //     decoration: InputDecoration(
          //       focusedBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(color: Color(0xFF1D3557), width: 2.0)),
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0)),
          //       labelText: 'Dias de duracion',
          //       labelStyle:
          //           TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
          //       //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
          //     ),
          //     keyboardType: TextInputType.number,
          //     autovalidate: true,
          //     autocorrect: true,
          //     onChanged: (value) {
          //       setState(() {
          //         cupos = value;
          //       });
          //     },
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              readOnly: true,
              controller: dateCtl,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Fecha Inicio',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              onTap: () async {
                String date = "";
                DateTime newDateTime = await showRoundedDatePicker(
                  height: 300,
                  context: context,
                  theme: ThemeData(primarySwatch: Colors.blue),
                  locale: Locale('en', 'US'),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 3),
                  borderRadius: 16,
                );
                date = format.format(newDateTime);
                dateCtl.text = date;
                if (newDateTime != null) {
                  setState(() => fechaInicio = date);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              readOnly: true,
              controller: dateCtl2,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Fecha Fin',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              onTap: () async {
                String date2 = "";
                DateTime newDateTime2 = await showRoundedDatePicker(
                  height: 300,
                  context: context,
                  theme: ThemeData(primarySwatch: Colors.blue),
                  locale: Locale('en', 'US'),
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 3),
                  borderRadius: 16,
                );
                date2 = format.format(newDateTime2);
                dateCtl2.text = date2;
                if (newDateTime2 != null) {
                  setState(() => fechaFin = date2);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: timeCtl,
              readOnly: true,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Hora de inicio',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              onTap: () async {
                final timePicked = await showRoundedTimePicker(
                  context: context,
                  background: Colors.white,
                  fontFamily: 'GilroyB',
                  theme: ThemeData(primarySwatch: Colors.blue),
                  locale: Locale('en', 'US'),
                  initialTime: TimeOfDay(hour: 12, minute: 0),
                  borderRadius: 20,
                );
                final localizations1 = MaterialLocalizations.of(context);
                final formattedTimeOfDay1 =
                    localizations1.formatTimeOfDay(timePicked);
                setState(() {
                  timeCtl.text = formattedTimeOfDay1.toString();
                  horaInicio = formattedTimeOfDay1.toString();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: timeCtl2,
              readOnly: true,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Hora final',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              onTap: () async {
                final timePicked = await showRoundedTimePicker(
                  context: context,
                  background: Colors.white,
                  fontFamily: 'GilroyB',
                  theme: ThemeData(primarySwatch: Colors.blue),
                  locale: Locale('en', 'US'),
                  initialTime: TimeOfDay(hour: 12, minute: 0),
                  borderRadius: 20,
                );
                final localizations2 = MaterialLocalizations.of(context);
                final formattedTimeOfDay2 =
                    localizations2.formatTimeOfDay(timePicked);
                setState(() {
                  timeCtl2.text = formattedTimeOfDay2.toString();
                  horaFin = formattedTimeOfDay2.toString();
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
                  _showMessage(
                      context, "Anuncio eliminado con exito!", Colors.green);
                  BlocProvider.of<AnuncioBloc>(context).add(AddAnuncio(
                      widget.imagenAnuncio,
                      widget.negocio.id,
                      fechaInicio,
                      fechaFin,
                      "0",
                      descCorta,
                      descLarga));
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

  void _showMessage(BuildContext context, String mensaje, MaterialColor green) {
        showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: green,
          position: FlashPosition.bottom,
          controller: controller,
          style: FlashStyle.floating,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: Text(
              mensaje,
              style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
            ),
          ),
        );
      },
    );
  }
}
