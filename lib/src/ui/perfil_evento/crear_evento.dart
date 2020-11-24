import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/ui/perfil_evento/FormularioEvento.dart';

class CrearEvento extends StatefulWidget {
  final Negocio negocio;

  const CrearEvento({Key key, this.negocio}) : super(key: key);
  @override
  _CrearEventoState createState() => _CrearEventoState();
}

class _CrearEventoState extends State<CrearEvento> {
  File portadaImage;
  File cartelImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1D3557),
        title: Text(
          "Nuevo Evento",
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
                      portadaImage == null
                          ? Container(
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
                                portadaImage,
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
                                'Foto Portada',
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
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                    width: 200,
                    height: 300,
                    color: Colors.redAccent,
                    child: Stack(
                      children: [
                        cartelImage == null
                            ? Container(
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
                                  cartelImage,
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
                            onPressed: getCartelImage,
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
                                  'Foto Cartel',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'GilroyB'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: FormularioEvento(
                negocio:widget.negocio,
                portadaImage : portadaImage,
                cartelimage: cartelImage,
                )
                  )
        ],
      ),
    );
  }

  Future getPortadaImage() async {
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      portadaImage = tempimage;
    });
  }

    Future getCartelImage() async {
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      cartelImage = tempimage;
    });
  }
}
