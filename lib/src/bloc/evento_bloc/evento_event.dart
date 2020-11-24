import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/evento_model.dart';

abstract class EventoEvent extends Equatable {
  const EventoEvent();
  @override
  List<Object> get props => [];
}

class LoadEvento extends EventoEvent{}

class AddEvento extends EventoEvent{
  
  final String idNegocio;
  final String tituloEvento;
  final File fotoPortada;
  final File fotoCartel;
  final String hora;
  final String fechaInicio;
  final String fechaFin;
  final String precio;
  final String cupos;
  final String vigencia;
  final String desc;


  const AddEvento(
    this.idNegocio,
    this.tituloEvento, 
    this.fotoPortada, 
    this.fotoCartel, 
    this.hora, 
    this.fechaInicio, 
    this.fechaFin, 
    this.precio, 
    this.cupos, 
    this.vigencia, 
    this.desc
    );

  @override
  List<Object> get props => [
    idNegocio,
    tituloEvento, 
    fotoPortada, 
    fotoCartel, 
    hora, 
    fechaInicio, 
    fechaFin, 
    precio, 
    cupos, 
    vigencia, 
    desc
    ];

  @override
  String toString()=> 'Adding Evento';
}

class EventoUpdated extends EventoEvent{

  final List<Evento> eventos;

  const EventoUpdated(this.eventos);

  @override
  List<Object> get props => [eventos];


}
