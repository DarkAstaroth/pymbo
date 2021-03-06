import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_event.dart';
import 'package:pymbo/src/bloc/evento_bloc/evento_state.dart';
import 'package:pymbo/src/repository/evento_repository.dart';

class EventoBloc extends Bloc<EventoEvent, EventoState> {
  final EventoRepository _eventoRepository;
  StreamSubscription _eventoSubscription;

  EventoBloc({@required EventoRepository eventoRepository})
      : assert(eventoRepository != null),
        _eventoRepository = eventoRepository;

  @override
  EventoState get initialState => EventoLoading();

  @override
  Stream<EventoState> mapEventToState(
    EventoEvent event,
  ) async* {
    if (event is LoadEvento) {
      yield* _mapLoadEventoToState();
    } else if (event is AddEvento) {
      yield* _mapAddEventoToState(event);
    } else if (event is EventoUpdated) {
      yield* _mapEventoUpdatedToState(event);
    }else if (event is EventoDeleted) {
      yield* _mapEventoDeletedToState(event);
    }else if (event is EventoUpdatedDB) {
      yield* _mapEventoUpdatedDBToState(event);
    }
  }

  Stream<EventoState> _mapLoadEventoToState() async* {
    yield EventoLoading();
    _eventoSubscription?.cancel();

    try {
      _eventoSubscription = _eventoRepository
          .getEventos()
          .listen((
            event
            ) => add(EventoUpdated(event)));
    } catch (e) {
      print(e);
      yield EventoNoLoaded();
    }
  }

  Stream<EventoState> _mapAddEventoToState(AddEvento event) async* {
    await _eventoRepository.putEventos(
        event.idNegocio,
        event.tituloEvento,
        event.fotoPortada,
        event.fotoCartel,
        event.hora,
        event.fechaInicio,
        event.fechaFin,
        event.precio,
        event.cupos,
        event.vigencia,
        event.desc);
  }

  Stream<EventoState> _mapEventoUpdatedToState(EventoUpdated event) async* {
    yield EventoLoaded(event.eventos);
  }

  Stream<EventoState> _mapEventoDeletedToState(EventoDeleted event) async* {
    await _eventoRepository.deleteEvento(
        event.idEvento
        );
  }

  Stream<EventoState> _mapEventoUpdatedDBToState(EventoUpdatedDB event) async* {
    await _eventoRepository.updateEvento(
        event.idEvento,
        event.tituloEvento,
        event.fotoPortada,
        event.fotoCartel,
        event.hora,
        event.fechaInicio,
        event.fechaFin,
        event.precio,
        event.cupos,
        event.vigencia,
        event.desc);
  }

  @override
  Future<void> close() {
    _eventoSubscription?.cancel();
    return super.close();
  }
}
