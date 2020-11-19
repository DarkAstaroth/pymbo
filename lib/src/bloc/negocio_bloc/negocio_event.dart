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
  final File profileImage;
  final File portadaImage;
  final String nombre;
  final String descCorta;
  final String descLarga;
  final String categoria;
  final String subCategoria;
  final String direccion;
  final String telefono;
  final String email;

  const AddNegocio(
    this.profileImage, 
    this.portadaImage, 
    this.nombre, 
    this.descCorta, 
    this.descLarga, 
    this.categoria, 
    this.subCategoria, 
    this.direccion, 
    this.telefono,
    this.email,
    );

  @override
  List<Object> get props => [
    profileImage, 
    portadaImage, 
    nombre, 
    descCorta, 
    descLarga, 
    categoria, 
    subCategoria, 
    direccion, 
    telefono,
    email,
    ];

  @override
  String toString()=> 'Adding Negocio';
}

class NegocioUpdated extends NegocioEvent{
  final List<Negocio> negocios;

  const NegocioUpdated(this.negocios);

  @override
  List<Object> get props => [negocios];


}
