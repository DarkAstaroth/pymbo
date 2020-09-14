import 'package:flutter/material.dart';

class CardNegocioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  // offset: Offset(3, 3), // changes position of shadow
                ),
              ],
            ),
            height: 340,
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: Image(image: AssetImage('assets/img/yuriña1.jpg')),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/img/yuriña2.jpg'))),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Yuriña -  tejidos con altura',
                            style: TextStyle(fontFamily: 'GilroyB'),
                          ),
                          subtitle: Row(
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 220),
              child: FloatingActionButton(onPressed: () {},
              child: Icon(Icons.favorite_border),
              backgroundColor: Color(0XFFE63946),
              )),
          )
        ],
      ),
    );
  }
}