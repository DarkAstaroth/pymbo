import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_event.dart';
import 'package:pymbo/src/bloc/producto_bloc/producto_state.dart';
import 'package:pymbo/src/repository/producto_repository.dart';

class ProductoBloc extends Bloc<ProductoEvent, ProductoState> {
  final ProductoRepository _productoRepository;
  StreamSubscription _productoSubscription;

  ProductoBloc({@required ProductoRepository productoRepository})
      : assert(productoRepository != null),
        _productoRepository = productoRepository;

  @override
  ProductoState get initialState => ProductoLoading();

  @override
  Stream<ProductoState> mapEventToState(
    ProductoEvent event,
  ) async* {
    if (event is LoadProducto) {
      yield* _mapLoadProductoToState();
    } else if (event is AddProducto) {
      yield* _mapAddProductoToState(event);
    } else if (event is ProductoUpdated) {
      yield* _mapProductoUpdatedToState(event);
    } else if (event is ProductoDeleted) {
      yield* _mapProductoDeletedToState(event);
    } else if (event is ProductoUpdatedDB) {
      yield* _mapProductoUpdatedDBToState(event);
    }
  }

  Stream<ProductoState> _mapLoadProductoToState() async* {
    yield ProductoLoading();
    _productoSubscription?.cancel();
    try {
      _productoSubscription = _productoRepository
          .getProductos()
          .listen((productos) => add(ProductoUpdated(productos)));
      //final List<Negocio> negocios = await _negocioRepository.getNegocios().first;
      //yield NegocioLoaded(negocios);

    } catch (_) {
      yield ProductoNoLoaded();
    }
  }

  Stream<ProductoState> _mapAddProductoToState(AddProducto event) async* {
    await _productoRepository.putProductos(
        event.idNegocio,
        event.nombreProducto,
        event.fotoProducto,
        event.descCorta,
        event.descLarga,
        event.precio,
        event.stock);
  }

  Stream<ProductoState> _mapProductoUpdatedToState(
      ProductoUpdated event) async* {
    yield ProductoLoaded(event.productos);
  }

  Stream<ProductoState> _mapProductoDeletedToState(
      ProductoDeleted event) async* {
    await _productoRepository.deleteProducto(event.idProducto);
  }

  Stream<ProductoState> _mapProductoUpdatedDBToState(ProductoUpdatedDB event) async* {
    await _productoRepository.updateProducto(
        event.idProducto,
        event.nombreProducto,
        event.fotoProducto,
        event.descCorta,
        event.descLarga,
        event.precio,
        event.stock
        );
  }

  @override
  Future<void> close() {
    _productoSubscription?.cancel();
    return super.close();
  }
}
