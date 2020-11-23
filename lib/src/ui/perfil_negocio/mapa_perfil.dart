import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pymbo/src/models/negocio_model.dart';

class MapaPerfil extends StatefulWidget {
  final Negocio negocio;

  const MapaPerfil({Key key, @required this.negocio}) : super(key: key);
  @override
  _MapaPerfilState createState() => _MapaPerfilState();
}

class _MapaPerfilState extends State<MapaPerfil> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  
  List<Marker> allMarkers =[];
  void initState() {
    super.initState();
    allMarkers.add(
      Marker(
        markerId: MarkerId(widget.negocio.nombre),
        draggable: false,
        position: LatLng(double.parse(widget.negocio.lat), double.parse(widget.negocio.lng)),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor: Color(0XFF1D3557),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                title: Text(
                  widget.negocio.nombre,
                  style: TextStyle(fontFamily: 'GilroyB'),
                ),
              ),
      body: GoogleMap(
        markers:Set.from(allMarkers) ,
        mapType: MapType.normal,
        initialCameraPosition:
            getGoogleplex(widget.negocio.lat, widget.negocio.lng),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

    );
  }



  CameraPosition getGoogleplex(String lat, String lng) {
    final latF =double.parse(lat);
    final lngF =double.parse(lng);
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(latF, lngF),
      zoom: 16.4746,
    );
    return _kGooglePlex;
  }
}
