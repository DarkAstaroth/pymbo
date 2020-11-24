import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/negocio_model.dart';

abstract class NegocioState extends Equatable{
  const NegocioState();

  @override
  List<Object> get props => [];

}

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
