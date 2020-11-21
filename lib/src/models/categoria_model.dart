import 'package:cloud_firestore/cloud_firestore.dart';

class Categoria {
  final String nombreCategoria;


  const Categoria(
      this.nombreCategoria,
      );

  static Categoria fromSnapshot(DocumentSnapshot snapshot) {
    return Categoria(
      snapshot.data['nombreCategoria'],
    );
  }
}
