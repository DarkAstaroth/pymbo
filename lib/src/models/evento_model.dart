import 'package:cloud_firestore/cloud_firestore.dart';

class Evento {
  final String idNegocio;
  final String tituloEvento;
  final String fotoPortada;
  final String fotoCartel;
  final String hora;
  final String fechaInicio;
  final String fechaFin;
  final String precio;
  final String cupos;
  final String vigencia;
  final String desc;
  final String idEvento;


  const Evento(
    this.idNegocio,
    this.tituloEvento, 
    this.fotoPortada, 
    this.fotoCartel, 
    this.hora, 
    this.fechaInicio, 
    this.fechaFin, 
    this.precio, 
    this.cupos, 
    this.vigencia, 
    this.desc,
    this.idEvento
      );

  static Evento fromSnapshot(DocumentSnapshot snapshot) {
    return Evento(
      snapshot.data['idNegocio'],
      snapshot.data['tituloEvento'],
      snapshot.data['fotoPortada'],
      snapshot.data['fotoCartel'],
      snapshot.data['hora'],
      snapshot.data['fechaInicio'],
      snapshot.data['fechaFin'],
      snapshot.data['precio'],
      snapshot.data['cupos'],
      snapshot.data['vigencia'],
      snapshot.data['desc'],
      snapshot.documentID
    );
  }
}