import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/producto_model.dart';

abstract class ProductoEvent extends Equatable {
  const ProductoEvent();
  @override
  List<Object> get props => [];
}

class LoadProducto extends ProductoEvent{}

class AddProducto extends ProductoEvent{
  
   final String idNegocio;
   final String nombreProducto;
   final File fotoProducto;
   final String descCorta;
   final String descLarga;
   final String precio;
   final String stock;

  const AddProducto(
    this.idNegocio,
    this.nombreProducto,
    this.fotoProducto,
    this.descCorta,
    this.descLarga,
    this.precio,
    this.stock,
    );

  @override
  List<Object> get props => [
    idNegocio,
    nombreProducto,
    fotoProducto,
    descCorta,
    descLarga,
    precio,
    stock,
    ];

  @override
  String toString()=> 'Adding Producto';
}

class ProductoUpdated extends ProductoEvent{

  final List<Producto> productos;

  const ProductoUpdated(this.productos);

  @override
  List<Object> get props => [productos];


}

class ProductoDeleted extends ProductoEvent{

  final String idProducto;

  const ProductoDeleted(this.idProducto);

  @override
  List<Object> get props => [idProducto];


}

class ProductoUpdatedDB extends ProductoEvent{

  final String idProducto;
  final String nombreProducto;
  final String fotoProducto;
  final String descCorta;
  final String descLarga;
  final String precio;
  final String stock;

  const ProductoUpdatedDB(this.idProducto, this.nombreProducto, this.fotoProducto, this.descCorta, this.descLarga, this.precio, this.stock);@override
  List<Object> get props => [
  idProducto,
  nombreProducto,
  fotoProducto,
  descCorta,
  descLarga,
  precio,
  stock,
  ];


}
