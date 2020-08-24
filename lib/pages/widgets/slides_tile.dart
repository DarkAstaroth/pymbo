import 'package:flutter/material.dart';

class SlidesTile extends StatelessWidget {
  String imageAssetsPath, title, desc;
  SlidesTile({this.imageAssetsPath,this.title,this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('titulo'),
          SizedBox(
            height: 12,
          ),
          Text('descripcion')
        ],
      ),
    );
  }
}
