import 'package:cloud_firestore/cloud_firestore.dart';

class Anuncio {
  final String fotoAnuncio;
  final String idNegocio;
  final String fechaInicio;
  final String fechaFin;
  final String diasDuracion;
  final String descCorta;
  final String desclarga;
  final String idAnuncio;


  const Anuncio(
      this.fotoAnuncio,
      this.idNegocio, 
      this.fechaInicio, 
      this.fechaFin, 
      this.diasDuracion, 
      this.descCorta, 
      this.desclarga, 
      this.idAnuncio,
      );

  static Anuncio fromSnapshot(DocumentSnapshot snapshot) {
    return Anuncio(
      snapshot.data['fotoAnuncio'],
      snapshot.data['idNegocio'],
      snapshot.data['fechaInicio'],
      snapshot.data['fechaFin'],
      snapshot.data['diasDuracion'],
      snapshot.data['descCorta'],
      snapshot.data['desclarga'],
      snapshot.documentID
    );
  }
}
