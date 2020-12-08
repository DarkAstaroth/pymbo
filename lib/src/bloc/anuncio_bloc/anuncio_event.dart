import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/anuncio_model.dart';

abstract class AnuncioEvent extends Equatable {
  const AnuncioEvent();
  @override
  List<Object> get props => [];
}

class LoadAnuncio extends AnuncioEvent{}

class AddAnuncio extends AnuncioEvent{
  
  final File fotoAnuncio;
  final String idNegocio;
  final String fechaInicio;
  final String fechaFin;
  final String diasDuracion;
  final String descCorta;
  final String desclarga;


  const AddAnuncio(
    this.fotoAnuncio, 
    this.idNegocio, 
    this.fechaInicio, 
    this.fechaFin, 
    this.diasDuracion, 
    this.descCorta, 
    this.desclarga, 
    );

  @override
  List<Object> get props => [
    fotoAnuncio,
    idNegocio,
    fechaInicio,
    fechaFin,
    diasDuracion,
    descCorta,
    desclarga
    ];

  @override
  String toString()=> 'Adding Anuncio';
}

class AnuncioUpdated extends AnuncioEvent{

  final List<Anuncio> anuncios;

  const AnuncioUpdated(this.anuncios);

  @override
  List<Object> get props => [anuncios];


}
class AnuncioDeleted extends AnuncioEvent{

  final String idAnuncio;

  const AnuncioDeleted(this.idAnuncio);

  @override
  List<Object> get props => [idAnuncio];


}

class AnuncioUpdatedDB extends AnuncioEvent{

    final String id;
    //final String anuncioUrl;
    final String fechaInicio;
    final String fechaFin;
    final String descCorta;
    final String desclarga;

  const  AnuncioUpdatedDB(this.id, this.fechaInicio, this.fechaFin, this.descCorta, this.desclarga);@override
  List<Object> get props => [fechaInicio,fechaFin,descCorta,desclarga];


}
