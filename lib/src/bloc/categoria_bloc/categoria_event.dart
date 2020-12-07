import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/categoria_model.dart';
import 'package:pymbo/src/models/negocio_model.dart';

abstract class CategoriaEvent extends Equatable {
  const CategoriaEvent();
  @override
  List<Object> get props => [];
}

class LoadCategoria extends CategoriaEvent{}

class AddCategoria extends CategoriaEvent{
  final String nombreCategoria;


  const AddCategoria(
    this.nombreCategoria, 
    );

  @override
  List<Object> get props => [
    nombreCategoria
    ];

  @override
  String toString()=> 'Adding Categoria';
}

class CategoriaUpdated extends CategoriaEvent{
  final List<Categoria> categorias;

  const CategoriaUpdated(this.categorias);

  @override
  List<Object> get props => [categorias];


}

class CategoriaDeleted extends CategoriaEvent{
  final String idCategoria;


  const CategoriaDeleted(
    this.idCategoria, 
    );

  @override
  List<Object> get props => [
    idCategoria
    ];

  @override
  String toString()=> 'Deleting Categoria';
}

class CategoriaUpdatedDB extends CategoriaEvent{
  final String idCategoria;
  final String nombreCategoria;


  const CategoriaUpdatedDB(
    this.idCategoria,
    this.nombreCategoria, 
    );

  @override
  List<Object> get props => [
    nombreCategoria
    ];

  @override
  String toString()=> 'Updating Categoria';
}
