import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_anuncio/formulario_anuncio.dart';

class CrearAnuncio extends StatefulWidget {
  final Negocio negocio;

  final String idAnuncio;
  final String fotoAnuncio;
  final String descCorta;
  final String descLarga;
  final String fechaInicio;
  final String fechaFin;
  final bool isUpdate;

  const CrearAnuncio(
      {Key key,
      this.negocio,
      this.idAnuncio,
      this.fotoAnuncio,
      this.descCorta,
      this.descLarga,
      this.fechaInicio,
      this.fechaFin,
      this.isUpdate})
      : super(key: key);

  @override
  _CrearAnuncioState createState() => _CrearAnuncioState();
}

class _CrearAnuncioState extends State<CrearAnuncio> {
  File imagenAnuncio;
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
          stateForm ? "Modificar Anuncio" : "Nuevo Anuncio",
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
                  height: 317,
                  color: Colors.redAccent,
                  child: Stack(
                    children: [
                      imagenAnuncio == null
                          ?  stateForm
                              ? Container(
                                  width: double.infinity,
                                  height: 317,
                                  color: Colors.white,
                                  child: ClipRRect(
                                    child: FadeInImage(
                                        fit: BoxFit.cover,
                                        placeholder: AssetImage(
                                            "assets/img/load-app-render.gif"),
                                        image: NetworkImage(
                                            widget.fotoAnuncio
                                            )
                                            ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 317,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/no-photo-perfil.jpg'),
                                          fit: BoxFit.cover)),
                                )
                          : Container(
                              width: double.infinity,
                              height: 317,
                              child: Image.file(
                                imagenAnuncio,
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
                          onPressed: getPortadaImage,
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
                                'Foto Anuncio',
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
              child: FormularioAnuncio(
                negocio: widget.negocio,
                idAnuncio: widget.idAnuncio,
                imagenAnuncio: imagenAnuncio,
                descCorta: widget.descCorta,
                descLarga: widget.descLarga,
                fechaInicio: widget.fechaInicio,
                fechaFin: widget.fechaFin,
                isUpdate: true,
              ))
        ],
      ),
    );
  }

  Future getPortadaImage() async {
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagenAnuncio = tempimage;
    });
  }
}
