import 'dart:io';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_event.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class FormularioProducto extends StatefulWidget {
  final Negocio negocio;
  final String idProducto;
  final File productoImage;
  final String nombreProducto;
  final String descCorta;
  final String descLarga;
  final String precio;
  final String stock;
  final bool isUpdate;

  const FormularioProducto(
      {Key key,
      this.negocio,
      this.idProducto,
      this.productoImage,
      this.nombreProducto,
      this.descCorta,
      this.descLarga,
      this.precio,
      this.stock,
      this.isUpdate})
      : super(key: key);

  @override
  _FormularioProductoState createState() => _FormularioProductoState();
}

class _FormularioProductoState extends State<FormularioProducto> {
  String nombreProducto;
  String descCorta;
  String descLarga;
  String precio;
  String stock;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    bool stateForm = widget.isUpdate;
    if (stateForm == null) {
      stateForm = false;
    }
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: stateForm ? widget.nombreProducto : "",
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyB'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Nombre del producto',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.emailAddress,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  nombreProducto = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: stateForm ? widget.descCorta : "",
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
              initialValue: stateForm ? widget.descLarga : "",
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
              onChanged: (value) {
                setState(() {
                  descLarga = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: stateForm ? widget.precio : "",
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
              initialValue: stateForm ? widget.stock : "",
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(fontFamily: 'GilroyL'),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF1D3557), width: 2.0)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                labelText: 'Stock',
                labelStyle:
                    TextStyle(color: Color(0xFF1D3557), fontFamily: 'GilroyB'),
                //suffixIcon: Icon(Icons.email, color: Color(0xFF1D3557)),
              ),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: true,
              onChanged: (value) {
                setState(() {
                  stock = value;
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
                    _showMessage(context, "Producto modificado con exito!",
                      Colors.green);
                  BlocProvider.of<ProductoBloc>(context).add(ProductoUpdatedDB(
                      widget.idProducto,
                      nombreProducto == null ?widget.nombreProducto : nombreProducto ,
                      //widget.productoImage,
                      descCorta == null ? widget.descCorta:descCorta,
                      descLarga == null ?widget.descLarga: descLarga,
                      precio == null ? widget.precio:precio,
                      stock == null ? widget.stock:stock
                      ));
                  Navigator.pop(context);
                  }else{
                    _showMessage(context, "Producto eliminada con exito!",
                      Color(0XFFE63946));
                  BlocProvider.of<ProductoBloc>(context).add(AddProducto(
                      widget.negocio.id,
                      nombreProducto,
                      widget.productoImage,
                      descCorta,
                      descLarga,
                      precio,
                      stock));
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

  void _showMessage(BuildContext context, String mensaje, Color color) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
      builder: (context, controller) {
        return Flash(
          backgroundColor: color,
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
