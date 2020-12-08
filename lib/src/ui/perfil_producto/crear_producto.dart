import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_producto/formulario_producto.dart';

class CrearProducto extends StatefulWidget {
  final Negocio negocio;
  final String idProducto;
  final String nombreProducto;
  final String imagenProductoD;
  final String descCorta;
  final String descLarga;
  final String precio;
  final String stock;
  final bool isUpdate;

  const CrearProducto(
      {Key key,
      this.negocio,
      this.idProducto,
      this.nombreProducto,
      this.imagenProductoD,
      this.descCorta,
      this.descLarga,
      this.precio,
      this.stock,
      this.isUpdate})
      : super(key: key);

  @override
  _CrearProductoState createState() => _CrearProductoState();
}

class _CrearProductoState extends State<CrearProducto> {
  File productoImage;

  @override
  Widget build(BuildContext context) {
    bool stateForm = widget.isUpdate;
    if (stateForm == null) {
      stateForm = false;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1D3557),
        title: Text(
          stateForm ? "Modificar Producto" : "Nuevo Producto",
          style: TextStyle(fontFamily: 'GilroyB'),
        ),
      ),
      backgroundColor: Color(0XFFF1FAEE),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Stack(
            children: [
              Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.redAccent,
                  child: Stack(
                    children: [
                      productoImage == null
                          ? stateForm
                              ? Container(
                                  width: double.infinity,
                                  height: 300,
                                  color: Colors.white,
                                  child: ClipRRect(
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        placeholder: AssetImage(
                                            "assets/img/load-app-render.gif"),
                                        image: NetworkImage(
                                            widget.imagenProductoD
                                            )
                                            ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/no-photo-perfil.jpg'),
                                          fit: BoxFit.cover)),
                                )
                          : Container(
                              width: double.infinity,
                              height: 300,
                              child: Image.file(
                                productoImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 180,
                        height: 50,
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          color: Color(0xFFE63946),
                          elevation: 0,
                          onPressed: getProductoImage,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Foto Producto',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'GilroyB'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: FormularioProducto(
                negocio: widget.negocio,
                idProducto: widget.idProducto,
                productoImage: productoImage,
                nombreProducto: widget.nombreProducto,
                descCorta: widget.descCorta,
                descLarga: widget.descLarga,
                precio: widget.precio,
                stock: widget.stock,
                isUpdate: widget.isUpdate,
              ))
        ],
      ),
    );
  }

  Future getProductoImage() async {
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      productoImage = tempimage;
    });
  }
}
