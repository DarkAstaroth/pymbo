import 'package:cloud_firestore/cloud_firestore.dart';

class Negocio {
  final String portadaImage;
  final String profileImage;
  final String nombre;
  final String descCorta;
  final String descLarga;
  final String categoria;
  final String subCategoria;
  final String direccion;
  final String telefono;
  final String email;

  const Negocio(
      this.profileImage,
      this.portadaImage,
      this.nombre, 
      this.descCorta, 
      this.descLarga,  
      this.categoria, 
      this.subCategoria,
      this.direccion, 
      this.telefono,
      this.email,);

  static Negocio fromSnapshot(DocumentSnapshot snapshot) {
    return Negocio(
      snapshot.data['profileImage'],
      snapshot.data['portadaImage'],
      snapshot.data['nombre'],
      snapshot.data['descCorta'],
      snapshot.data['descLarga'],
      snapshot.data['categoria'],
      snapshot.data['subCategoria'],
      snapshot.data['direccion'],
      snapshot.data['telefono'],
      snapshot.data['email'],
    );
  }
}
