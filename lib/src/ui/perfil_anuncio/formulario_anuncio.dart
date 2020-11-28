import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
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
  String titulo;
  String precio;
  String cupos;
  String desc;

  final format = DateFormat("dd-MM-yyyy");

  final formKey = GlobalKey<FormState>();
  DateTime dateTime;
  DateTime dateTime2;
  TextEditingController dateCtl = TextEditingController();
  TextEditingController dateCtl2 = TextEditingController();
  TextEditingController timeCtl = TextEditingController();

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
                  titulo = value;
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
                  desc = value;
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
                labelText: 'Dias de duracion',
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
                  setState(() => dateTime = newDateTime);
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
                String date = "";
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
                date = format.format(newDateTime2);
                dateCtl2.text = date;
                if (newDateTime2 != null) {
                  setState(() => dateTime2 = newDateTime2);
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
                final timePicked  = await showRoundedTimePicker(
                  context: context,
                  background: Colors.white,
                  fontFamily: 'GilroyB',
                  theme: ThemeData(primarySwatch: Colors.blue),
                  locale: Locale('en', 'US'),
                  initialTime: TimeOfDay(hour: 12,minute: 0),
                  borderRadius: 20,
                );
                setState(() {
                  timeCtl.text = timePicked.toString();
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
                onPressed: () {},
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
