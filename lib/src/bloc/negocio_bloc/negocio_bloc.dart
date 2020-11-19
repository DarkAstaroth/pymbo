import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_event.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/models/negocio_model.dart';
import 'package:pymbo/src/repository/negocio_repository.dart';

class NegocioBloc extends Bloc<NegocioEvent,NegocioState>{
  final NegocioRepository _negocioRepository;
  StreamSubscription _negocioSubscription;

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
    } else if (event is AddNegocio){
      yield* _mapAddNegocioToState(event);
    } else if(event is NegocioUpdated){
      yield* _mapNegocioUpdatedToState(event);
    }
  }

  Stream<NegocioState> _mapLoadNegocioToState() async*{
    yield NegocioLoading();
    _negocioSubscription?.cancel();
    try {
      _negocioSubscription = _negocioRepository.getNegocios().listen(
        (negocios) =>add(NegocioUpdated(negocios))
      );
      //final List<Negocio> negocios = await _negocioRepository.getNegocios().first;
      //yield NegocioLoaded(negocios);
      
    } catch (_) {
      yield NegocioNoLoaded();
    }
  }

  Stream<NegocioState> _mapAddNegocioToState(AddNegocio event) async*{
    await _negocioRepository.putNegocios(event.portadaImage, event.nombre, event.email);
  }

  Stream<NegocioState> _mapNegocioUpdatedToState(NegocioUpdated event) async*{
    yield NegocioLoaded(event.negocios);
  }

  @override
  Future<void> close() {
    _negocioSubscription?.cancel();
    return super.close();
  }

}