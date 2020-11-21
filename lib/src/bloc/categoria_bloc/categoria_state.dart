import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/categoria_model.dart';

abstract class CategoriaState extends Equatable{
  const CategoriaState();

  @override
  List<Object> get props => [];

}

// tres estados

// 1.- Categoria loading -> los Categorias estan cargando estan cargando
// 2.- Negodcio loaded -> los Categorias se cargaron
// 3.- Categoria no loaded -> no se pudieron cargar los Categorias

class CategoriaLoading extends CategoriaState{
  @override
  String toString() => 'Categoria loading';
}

class CategoriaLoaded extends CategoriaState{
  final List<Categoria> categorias;

  const CategoriaLoaded([this.categorias]);

  @override
  List<Object> get props => [categorias];

  @override
  String toString() => 'Categorias Loaded';
  
}

class CategoriaNoLoaded extends CategoriaState{
  @override
  String toString() => 'Categoria no loaded';
}
