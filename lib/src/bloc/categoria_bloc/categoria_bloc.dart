import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_event.dart';
import 'package:pymbo/src/bloc/categoria_bloc/categoria_state.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_event.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_state.dart';
import 'package:pymbo/src/repository/categoria_repository.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  final CategoriaRepository _categoriaRepository;
  StreamSubscription _categoriaSubscription;

  CategoriaBloc({@required CategoriaRepository categoriaRepository})
      : assert(categoriaRepository != null),
        _categoriaRepository = categoriaRepository;

  @override
  CategoriaState get initialState => CategoriaLoading();

  @override
  Stream<CategoriaState> mapEventToState(
    CategoriaEvent event,
  ) async* {
    if (event is LoadCategoria) {
      yield* _mapLoadCategoriaToState();
    } else if (event is AddCategoria) {
      yield* _mapAddCategoriaToState(event);
    } else if (event is CategoriaUpdated) {
      yield* _mapCategoriaUpdatedToState(event);
    } else if (event is CategoriaDeleted) {
      yield* _mapCategoriaDeletedToState(event);
    } else if (event is CategoriaUpdatedDB) {
      yield* _mapCategoriaUpdatedDBToState(event);
    }
  }

  Stream<CategoriaState> _mapLoadCategoriaToState() async* {
    yield CategoriaLoading();
    _categoriaSubscription?.cancel();
    try {
      _categoriaSubscription = _categoriaRepository
          .getCategorias()
          .listen((categorias) => add(CategoriaUpdated(categorias)));
    } catch (_) {
      yield CategoriaNoLoaded();
    }
  }

  Stream<CategoriaState> _mapAddCategoriaToState(AddCategoria event) async* {
    await _categoriaRepository.putCategoria(
      event.nombreCategoria,
    );
  }

  Stream<CategoriaState> _mapCategoriaUpdatedToState(
      CategoriaUpdated event) async* {
    yield CategoriaLoaded(event.categorias);
  }

  Stream<CategoriaState> _mapCategoriaDeletedToState(
      CategoriaDeleted event) async* {
    await _categoriaRepository.deleteCategoria(
      event.idCategoria,
    );
  }

  Stream<CategoriaState> _mapCategoriaUpdatedDBToState(
      CategoriaUpdatedDB event) async* {
    await _categoriaRepository.updateCategoria(
        event.idCategoria, 
        event.nombreCategoria);
  }

  @override
  Future<void> close() {
    _categoriaSubscription?.cancel();
    return super.close();
  }
}
