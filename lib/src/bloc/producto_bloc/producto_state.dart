import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/producto_model.dart';


abstract class ProductoState extends Equatable{
  const ProductoState();

  @override
  List<Object> get props => [];

}

class ProductoLoading extends ProductoState{
  @override
  String toString() => 'Producto loading';
}

class ProductoLoaded extends ProductoState{
  final List<Producto> productos;

  const ProductoLoaded([this.productos]);

  @override
  List<Object> get props => [productos];

  @override
  String toString() => 'Producto Loaded';
  
}

class ProductoNoLoaded extends ProductoState{
  @override
  String toString() => 'Producto no loaded';
}
