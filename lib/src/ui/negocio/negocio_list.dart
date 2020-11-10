import 'package:flutter/material.dart';
import 'package:pymbo/src/ui/negocio/user_card_negocio.dart';

class NegocioList extends StatefulWidget {
  @override
  _NegocioListState createState() => _NegocioListState();
}

class _NegocioListState extends State<NegocioList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          UserCardNegocio(),
          Divider(
            height: 1,
          ),
          UserCardNegocio(),
          Divider(
            height: 1,
          ),
          UserCardNegocio(),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
