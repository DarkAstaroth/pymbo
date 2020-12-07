import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_event.dart';

class FormularioCategoria extends StatefulWidget {
  final String id;
  final String nombreCategoria;
  final bool isUpdate;

  const FormularioCategoria(
      {Key key, this.id, this.nombreCategoria, this.isUpdate})
      : super(key: key);
  @override
  _FormularioCategoriaState createState() => _FormularioCategoriaState();
}

class _FormularioCategoriaState extends State<FormularioCategoria> {
  String nombreCategoria;
  final categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool stateForm = widget.isUpdate;
    if (stateForm == null) {
      stateForm = false;
    }
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              stateForm ? "Modificar categoria" : "Crear categoria",
              style: TextStyle(fontFamily: 'GilroyB', fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: stateForm ? widget.nombreCategoria : "",
              textCapitalization: TextCapitalization.sentences,
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
                  if (stateForm) {
                    _showMessageUpdated();
                    BlocProvider.of<CategoriaBloc>(context).add(
                        CategoriaUpdatedDB(
                            widget.id,
                            nombreCategoria == null
                                ? widget.nombreCategoria
                                : nombreCategoria));
                    Navigator.pop(context);
                  } else {
                    _showMessageCreated();
                    BlocProvider.of<CategoriaBloc>(context)
                        .add(AddCategoria(nombreCategoria));
                    Navigator.pop(context);
                  }
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

  void _showMessageCreated({
    Duration duration,
    flashStyle = FlashStyle.floating,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: Colors.green,
          position: FlashPosition.bottom,
          controller: controller,
          style: flashStyle,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: Text(
              'Categoria registrada con exito',
              style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
            ),
          ),
        );
      },
    );
  }

  void _showMessageUpdated({
    Duration duration,
    flashStyle = FlashStyle.floating,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: Colors.green,
          position: FlashPosition.bottom,
          controller: controller,
          style: flashStyle,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: Text(
              'Categoria Modificada con exito',
              style: TextStyle(color: Colors.white, fontFamily: 'GilroyB'),
            ),
          ),
        );
      },
    );
  }
}
