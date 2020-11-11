import 'package:cloud_firestore/cloud_firestore.dart';

class Negocio{
  final String nombre;
  final String descCorta;
  final String descLarga;
  final String direccion;
  final String email;

  const Negocio(this.nombre,this.descCorta,this.descLarga,this.direccion,this.email);

  static Negocio fromSnapshot(DocumentSnapshot snapshot){
    return Negocio(
      snapshot.data['nombre'],
      snapshot.data['descCorta'],
      snapshot.data['descLarga'],
      snapshot.data['direccion'],
      snapshot.data['email'],
    );
  }
  
}