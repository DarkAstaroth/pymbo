import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_event.dart';
import 'package:pymbo/src/bloc/anuncio_bloc/anuncio_state.dart';
import 'package:pymbo/src/repository/anuncio_repository.dart';

class AnuncioBloc extends Bloc<AnuncioEvent, AnuncioState> {
  final AnuncioRepository _anuncioRepository;
  StreamSubscription _anuncioSubscription;

  AnuncioBloc({@required AnuncioRepository anuncioRepository})
      : assert(anuncioRepository != null),
        _anuncioRepository = anuncioRepository;

  @override
  AnuncioState get initialState => AnuncioLoading();

  @override
  Stream<AnuncioState> mapEventToState(
    AnuncioEvent event,
  ) async* {
    if (event is LoadAnuncio) {
      yield* _mapLoadAnuncioToState();
    } else if (event is AddAnuncio) {
      yield* _mapAddAnuncioToState(event);
    } else if (event is AnuncioUpdated) {
      yield* _mapAnuncioUpdatedToState(event);
    } else if (event is AnuncioDeleted) {
      yield* _mapAnuncioDeletedToState(event);
    } else if (event is AnuncioUpdatedDB) {
      yield* _mapAnuncioUpdatedDBToState(event);
    }
  }

  Stream<AnuncioState> _mapLoadAnuncioToState() async* {
    yield AnuncioLoading();
    _anuncioSubscription?.cancel();
    try {
      _anuncioSubscription = _anuncioRepository
          .getAnuncios()
          .listen((anuncios) => add(AnuncioUpdated(anuncios)));
      //final List<Negocio> negocios = await _negocioRepository.getNegocios().first;
      //yield NegocioLoaded(negocios);

    } catch (_) {
      yield AnuncioNoLoaded();
    }
  }

  Stream<AnuncioState> _mapAddAnuncioToState(AddAnuncio event) async* {
    await _anuncioRepository.putAnuncios(
        event.fotoAnuncio,
        event.idNegocio,
        event.fechaInicio,
        event.fechaFin,
        event.diasDuracion,
        event.descCorta,
        event.desclarga);
  }

  Stream<AnuncioState> _mapAnuncioUpdatedToState(AnuncioUpdated event) async* {
    yield AnuncioLoaded(event.anuncios);
  }

  Stream<AnuncioState> _mapAnuncioDeletedToState(AnuncioDeleted event) async* {
     await _anuncioRepository.deleteAnuncio(
      event.idAnuncio);
  }

    Stream<AnuncioState> _mapAnuncioUpdatedDBToState(AnuncioUpdatedDB event) async* {
     await _anuncioRepository.updateAnuncio(
      event.id,
      event.anuncioUrl,
      event.fechaInicio,
      event.fechaFin,
      event.descCorta,
      event.desclarga
      );
  }

  

  @override
  Future<void> close() {
    _anuncioSubscription?.cancel();
    return super.close();
  }
}
