import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_event.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/repository/negocio_repository.dart';

class NegocioBloc extends Bloc<NegocioEvent,NegocioState>{
  final NegocioRepository _negocioRepository;

  NegocioBloc({@required NegocioRepository negocioRepository})
    : assert (negocioRepository != null),
    _negocioRepository = negocioRepository;


  @override
  NegocioState get initialState => NegocioLoading();  

  @override
  Stream<NegocioState> mapEventToState(
    NegocioEvent event,
  ) async* {
    if (event is LoadNegocio) {
      yield* _mapLoadNegocioToState();
    }
  }

  Stream<NegocioState> _mapLoadNegocioToState() async*{
    yield NegocioLoading();
    try {

      final List<Negocio> negocios = await _negocioRepository.getNegocios().first;
      yield NegocioLoaded(negocios);
      
    } catch (_) {
      yield NegocioNoLoaded();
    }
  }

}