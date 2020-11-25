import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/models/evento_model.dart';

class EventoRepository {
  final dataBaseReference = Firestore.instance.collection('eventos');

  Stream<List<Evento>> getEventos() {
    return dataBaseReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Evento.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> putEventos(
    String idNegocio,
    String tituloEvento,
    File fotoPortada,
    File fotoCartel,
    String hora,
    String fechaInicio,
    String fechaFin,
    String precio,
    String cupos,
    String vigencia,
    String desc
  ) async {
    // Save portada image
    var timeKey = DateTime.now();

    // imagen de portada para los eventos

    final StorageReference eventoPortadaImageRef =
        FirebaseStorage.instance.ref().child("Fotos Portada Eventos");

    final StorageUploadTask uploadPortadaTask = eventoPortadaImageRef
        .child(timeKey.toString() + ".jpg")
        .putFile(fotoPortada);
    var eventoPortadaImageURL =
        await (await uploadPortadaTask.onComplete).ref.getDownloadURL();
    var eventoPortadaUrl = eventoPortadaImageURL.toString();

    //imagen de cartel para los eventos

    final StorageReference eventoCartelImageRef =
        FirebaseStorage.instance.ref().child("Fotos Cartel Eventos");

    final StorageUploadTask uploadCartelTask = eventoCartelImageRef
        .child(timeKey.toString() + ".jpg")
        .putFile(fotoCartel);
    var eventoCartelImageURL =
        await (await uploadCartelTask.onComplete).ref.getDownloadURL();
    var eventoCartelUrl = eventoCartelImageURL.toString();




    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    dataBaseReference.document().setData({
      'idNegocio': idNegocio,
      'tituloEvento': tituloEvento,
      'fotoPortada': eventoPortadaUrl,
      'fotoCartel': eventoCartelUrl,
      'hora': hora,
      'fechaInicio': fechaInicio,
      'fechaFin': fechaFin,
      'precio': precio,
      'cupos': cupos,
      'vigencia': vigencia,
      'desc': desc,
      'date': date,
      'time': time
    });
  }
}
