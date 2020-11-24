import 'package:cloud_firestore/cloud_firestore.dart';

class Producto {
  final String idNegocio;
  final String nombreProducto;
  final String fotoProducto;
  final String descCorta;
  final String descLarga;
  final String precio;
  final String stock;
  final String idProducto;

  const Producto(this.idNegocio, this.nombreProducto, this.fotoProducto,
      this.descCorta, this.descLarga, this.precio, this.stock, this.idProducto);

  static Producto fromSnapshot(DocumentSnapshot snapshot) {
    return Producto(
        snapshot.data['idNegocio'],
        snapshot.data['nombreProducto'],
        snapshot.data['fotoProducto'],
        snapshot.data['descCorta'],
        snapshot.data['descLarga'],
        snapshot.data['precio'],
        snapshot.data['stock'],
        snapshot.documentID);
  }
}
