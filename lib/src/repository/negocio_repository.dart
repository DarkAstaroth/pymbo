import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class NegocioRepository{
  final dataBaseReference = Firestore.instance;

  Stream <List<Negocio>> getNegocios(){
    return dataBaseReference.collection('negocios').snapshots()
      .map((snapshot){
        return snapshot.documents.map((doc) => Negocio.fromSnapshot(doc)).toList();
      });
  }
}