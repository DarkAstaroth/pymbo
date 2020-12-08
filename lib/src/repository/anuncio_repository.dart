import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/models/anuncio_model.dart';

class AnuncioRepository {
  final dataBaseReference = Firestore.instance.collection('anuncios');

  Stream<List<Anuncio>> getAnuncios() {
    return dataBaseReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Anuncio.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> deleteAnuncio(String id) async{
    await dataBaseReference.document(id).delete();
  }

  Future<void> updateAnuncio(
    String id,
    String anuncioUrl,
    String fechaInicio,
    String fechaFin,
    String descCorta,
    String desclarga
    ) async{
    await dataBaseReference.document(id).updateData({
      'fotoAnuncio': anuncioUrl,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'descCorta': descCorta,
      'desclarga': desclarga,
    });

  }

  Future<void> putAnuncios(
    File fotoAnuncio,
    String idNegocio,
    String fechaInicio,
    String fechaFin,
    String diasDuracion,
    String descCorta,
    String desclarga,
  ) async {
    // Save portada image

    final StorageReference anuncioImageRef =
        FirebaseStorage.instance.ref().child("Fotos Anuncios");
    var timeKey = DateTime.now();
    final StorageUploadTask uploadTask =
        anuncioImageRef.child(timeKey.toString() + ".jpg").putFile(fotoAnuncio);
    var anuncioImageURL =
        await (await uploadTask.onComplete).ref.getDownloadURL();
    var anuncioUrl = anuncioImageURL.toString();

    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    dataBaseReference.document().setData({
      'fotoAnuncio': anuncioUrl,
      'idNegocio': idNegocio,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'diasDuracion': diasDuracion,
      'descCorta': descCorta,
      'desclarga': desclarga,
      'date': date,
      'time': time
    });
  }
}
