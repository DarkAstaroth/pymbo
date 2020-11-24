import 'package:equatable/equatable.dart';
import 'package:pymbo/src/models/evento_model.dart';


abstract class EventoState extends Equatable{
  const EventoState();

  @override
  List<Object> get props => [];

}

class EventoLoading extends EventoState{
  @override
  String toString() => 'Evento loading';
}

class EventoLoaded extends EventoState{
  final List<Evento> eventos;

  const EventoLoaded([this.eventos]);

  @override
  List<Object> get props => [eventos];

  @override
  String toString() => 'Negocios Loaded';
  
}

class EventoNoLoaded extends EventoState{
  @override
  String toString() => 'Evento no loaded';
}
