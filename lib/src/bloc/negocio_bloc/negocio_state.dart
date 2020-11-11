import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/negocio_model.dart';

abstract class NegocioState extends Equatable{
  const NegocioState();

  @override
  List<Object> get props => [];

}

// tres estados

// 1.- Negocio loading -> los negocios estan cargando estan cargando
// 2.- Negodcio loaded -> los negocios se cargaron
// 3.- Negocio no loaded -> no se pudieron cargar los negocios

class NegocioLoading extends NegocioState{
  @override
  String toString() => 'Negocio loading';
}

class NegocioLoaded extends NegocioState{
  final List<Negocio> negocios;

  const NegocioLoaded([this.negocios]);

  @override
  List<Object> get props => [negocios];

  @override
  String toString() => 'Negocios Loaded';
  
}

class NegocioNoLoaded extends NegocioState{
  @override
  String toString() => 'Negocio no loaded';
}
