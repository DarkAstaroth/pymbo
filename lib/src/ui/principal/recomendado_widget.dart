import 'package:flutter/material.dart';

class RecomendadoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 150,
      width: double.infinity,
      // color: Colors.blue,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recomendados',
                style: TextStyle(fontFamily: 'GilroyB'),
              ),
              Text(
                'Ver Todos',
                style: TextStyle(fontFamily: 'GilroyB'),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  recomendadoItem(),
                  recomendadoItem(),
                  recomendadoItem(),
                  recomendadoItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget recomendadoItem() {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
        top: 10,
        bottom: 10
      ),
      child: Container(
        height: double.infinity,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              // offset: Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
                height: double.infinity,
                width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  child: Image(
                    image: AssetImage('assets/img/yuriña2.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Negocio 1',
                    style: TextStyle(fontFamily: 'GilroyB', fontSize: 15),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                        color: Color(0XFFFFC600),
                      ),
                      Icon(
                        Icons.star_border,
                        size: 10,
                        color: Color(0XFFFFC600),
                      )
                    ],
                  ),
                  Text(
                    'categoria',
                    style: TextStyle(fontFamily: 'GilroyL', fontSize: 10),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}