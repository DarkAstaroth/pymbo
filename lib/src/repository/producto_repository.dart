import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/models/producto_model.dart';

class ProductoRepository {
  final dataBaseReference = Firestore.instance.collection('productos');

  Stream<List<Producto>> getProductos() {
    return dataBaseReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Producto.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> putProductos(
      String idNegocio,
      String nombreProducto,
      File fotoProducto,
      String descCorta,
      String descLarga,
      String precio,
      String stock
      ) async {
    // Save portada image
    var timeKey = DateTime.now();

    // imagen de portada para los productos

    final StorageReference productoImageRef =
        FirebaseStorage.instance.ref().child("Fotos Productos");

    final StorageUploadTask uploadTask = productoImageRef
        .child(timeKey.toString() + ".jpg")
        .putFile(fotoProducto);
    var productoImageURL =
        await (await uploadTask.onComplete).ref.getDownloadURL();
    var productoUrl = productoImageURL.toString();

    //imagen de cartel para los productos

    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    dataBaseReference.document().setData({
      'idNegocio': idNegocio,
      'nombreProducto': nombreProducto,
      'fotoProducto': productoUrl,
      'descCorta': descCorta,
      'descLarga': descLarga,
      'precio': precio,
      'stock': stock,
      'date': date,
      'time': time
    });
  }
}
