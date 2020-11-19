import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class NegocioRepository{
  final dataBaseReference = Firestore.instance.collection('negocios');

  Stream <List<Negocio>> getNegocios(){
    return dataBaseReference.snapshots()
      .map((snapshot){
        return snapshot.documents.map((doc) => Negocio.fromSnapshot(doc)).toList();
      });
  }

  Future<void> putNegocios(File portadaImage,String nombre,String email)async{

    // Save image

    final StorageReference negocioImageRef = FirebaseStorage.instance.ref().child("Negocio Image");
    var timeKey = DateTime.now();
    final StorageUploadTask uploadTask = negocioImageRef.child(timeKey.toString() + ".jpg").putFile(portadaImage);
    var imageURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url= imageURL.toString();

    // Save Post

    var formatDate = DateFormat('MMM d, yyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(timeKey);
    String time = formatTime.format(timeKey);

    dataBaseReference.document().setData(
      {
        'portadaImage' : url,
        'nombre' : nombre,
        'email' : email,
        'date' : date,
        'time' : time
      }
    );

  }



}