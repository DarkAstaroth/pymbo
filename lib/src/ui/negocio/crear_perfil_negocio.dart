import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pymbo/src/ui/negocio/formulario_negocio.dart';

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
      String lng
  );

class CrearPerfilNegocio extends StatefulWidget {
  final OnSaveCallback onSave;

  const CrearPerfilNegocio({Key key, @required this.onSave}) : super(key: key);

  @override
  _CrearPerfilNegocioState createState() => _CrearPerfilNegocioState();
}

class _CrearPerfilNegocioState extends State<CrearPerfilNegocio> {
  File samplePortadaImage;
  File sampleProfileImage;
  String nombre;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1D3557),
        title: Text(
          "Nuevo Negocio",
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
                  height: 200,
                  color: Colors.redAccent,
                  child: Stack(
                    children: [
                      samplePortadaImage == null
                          ? Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/no-photo-perfil.jpg'),
                                      fit: BoxFit.cover)),
                            )
                          : Container(
                              width: double.infinity,
                              height: 200,
                              child: Image.file(
                                samplePortadaImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 150,
                        height: 50,
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          color: Color(0xFFE63946),
                          elevation: 0,
                          onPressed: getPortadaImage,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Subir Foto',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'GilroyB'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: sampleProfileImage == null
                            ? Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/profile-img.jpg'),
                                        fit: BoxFit.cover)),
                              )
                            : Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ) ,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                  sampleProfileImage,
                                  fit: BoxFit.cover, 
                                ),
                                )
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    child: RaisedButton(
                            color: Color(0xFFE63946),
                            elevation: 0,
                            onPressed: getProfileImage,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Subir Foto Perfil',
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'GilroyB'),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: FormularioNegocio(
                  samplePoI: samplePortadaImage, sampleProI: sampleProfileImage, onSaveCall: widget.onSave))
        ],
      ),
    );
  }

  Future getPortadaImage() async {
    var tempimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      samplePortadaImage = tempimage;
    });
  }

  Future getProfileImage() async {
    var tempimage2 = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleProfileImage = tempimage2;
    });
  }
}
