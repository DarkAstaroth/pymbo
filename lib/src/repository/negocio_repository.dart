import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class NegocioRepository {
  final dataBaseReference = Firestore.instance.collection('negocios');

  Stream<List<Negocio>> getNegocios() {
    return dataBaseReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Negocio.fromSnapshot(doc))
          .toList();
    });
  }

  Future<void> putNegocios(
      File portadaImage,
      File profileImage,
      String nombre,
      String descCorta,
      String descLarga,
      String categoria,
      String subCategoria,
      String direccion,
      String telefono,
      String email,
      String lat,
      String lng
      ) async {
    // Save portada image

    final StorageReference negocioPortadaImageRef =
        FirebaseStorage.instance.ref().child("Negocio Portadas");
    var timeKey = DateTime.now();
    final StorageUploadTask uploadPortadaTask = negocioPortadaImageRef
        .child(timeKey.toString() + ".jpg")
        .putFile(portadaImage);
    var portadaImageURL =
        await (await uploadPortadaTask.onComplete).ref.getDownloadURL();
    var portadaUrl = portadaImageURL.toString();

    // Save profile image

    final StorageReference negocioProdileImageRef =
        FirebaseStorage.instance.ref().child("Negocio Profiles");
    final StorageUploadTask uploadProfileTask = negocioProdileImageRef
        .child(timeKey.toString() + ".jpg")
        .putFile(profileImage);
    var profileImageURL =
        await (await uploadProfileTask.onComplete).ref.getDownloadURL();
    var profileUrl = profileImageURL.toString();

    // Save Post

    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    dataBaseReference.document().setData({
      'portadaImage': portadaUrl,
      'profileImage': profileUrl,
      'nombre': nombre,
      'descCorta': descCorta,
      'descLarga': descLarga,
      'categoria': categoria,
      'subCategoria': subCategoria,
      'direccion': direccion,
      'telefono': telefono,
      'email': email,
      'lat': lat,
      'lng': lng,
      'date': date,
      'time': time
    });
  }
}
