import 'package:equatable/equatable.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/anuncio_model.dart';
import 'package:pymbo/src/models/negocio_model.dart';

abstract class AnuncioState extends Equatable{
  const AnuncioState();

  @override
  List<Object> get props => [];

}

class AnuncioLoading extends AnuncioState{
  @override
  String toString() => 'Anuncio loading';
}

class AnuncioLoaded extends AnuncioState{
  final List<Anuncio> anuncios;

  const AnuncioLoaded([this.anuncios]);

  @override
  List<Object> get props => [anuncios];

  @override
  String toString() => 'Negocios Loaded';
  
}

class AnuncioNoLoaded extends AnuncioState{
  @override
  String toString() => 'Anuncio no loaded';
}
