import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/negocio_model.dart';

abstract class NegocioEvent extends Equatable {
  const NegocioEvent();
  @override
  List<Object> get props => [];
}

class LoadNegocio extends NegocioEvent{}

class AddNegocio extends NegocioEvent{
  final File portadaImage;
  final String nombre;
  final String email;

  const AddNegocio(this.portadaImage, this.nombre, this.email);

  @override
  List<Object> get props => [portadaImage,nombre,email];

  @override
  String toString()=> 'Adding Negocio';
}

class NegocioUpdated extends NegocioEvent{
  final List<Negocio> negocios;

  const NegocioUpdated(this.negocios);

  @override
  List<Object> get props => [negocios];


}