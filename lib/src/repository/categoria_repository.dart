import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/models/categoria_model.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class CategoriaRepository {
  final dataBaseReference = Firestore.instance.collection('categorias');

  Stream<List<Categoria>> getCategorias() {
    return dataBaseReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Categoria.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> putCategoria(
      String nombreCategoria,
      ) async {

    var timeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    dataBaseReference.document().setData({
      'nombreCategoria': nombreCategoria,
      'date': date,
      'time': time
    });
  }
}
