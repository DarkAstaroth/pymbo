import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0XFFA8DADC),
          ),
          height: 130,
          width: double.infinity,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Image(image: AssetImage('assets/img/banner1.png')),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anuncia',
                      style: TextStyle(fontFamily: 'GilroyL', fontSize: 12),
                    ),
                    Text(
                      'Tu Negocio',
                      style: TextStyle(
                          fontFamily: 'GilroyB',
                          fontSize: 22,
                          color: Color(0XFF1D3557)),
                    ),
                    OutlineButton(
                        child: Text(
                          'Comenzar',
                          style: TextStyle(
                              fontFamily: 'GilroyB',
                              fontSize: 12,
                              color: Color(0XFF1D3557)),
                        ),
                        color: Color(0XFF1D3557),
                        onPressed: () {})
                  ],
                ))
          ],
        )
      ],
    );
  }
}