import 'package:cloud_firestore/cloud_firestore.dart';

class Categoria {
  final String nombreCategoria;
  final String id;

  const Categoria(
      this.nombreCategoria, this.id,
      );

  static Categoria fromSnapshot(DocumentSnapshot snapshot) {
    return Categoria(
      snapshot.data['nombreCategoria'],
      snapshot.documentID
    );
  }
}
