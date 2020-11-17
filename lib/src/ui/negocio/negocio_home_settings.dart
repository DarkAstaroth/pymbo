import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_event.dart';
import 'package:pymbo/src/repository/negocio_repository.dart';
import 'package:pymbo/src/ui/negocio/negocio_list.dart';


class NegocioHomeSettings extends StatefulWidget {
  @override
  _NegocioHomeSettingsState createState() => _NegocioHomeSettingsState();
}

class _NegocioHomeSettingsState extends State<NegocioHomeSettings> {
  final NegocioRepository _negocioRepository = NegocioRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NegocioBloc>(
        create: (context) => NegocioBloc(negocioRepository: _negocioRepository)
          ..add(LoadNegocio()),
        child:NegocioList() ,
            
        );
  }
}
















