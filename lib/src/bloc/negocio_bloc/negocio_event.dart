import 'package:equatable/equatable.dart';

abstract class NegocioEvent extends Equatable {
  const NegocioEvent();
  @override
  List<Object> get props => [];
}

class LoadNegocio extends NegocioEvent{}
