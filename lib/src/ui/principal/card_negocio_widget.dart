import 'package:flutter/material.dart';

class CardNegocioWidget extends StatelessWidget {
  final String fotoAnuncio;
  final String descLarga;

  const CardNegocioWidget({Key key, this.fotoAnuncio, this.descLarga}) : super(key: key);
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
            height: 350,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: ClipRRect(
                      
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/img/load-app-render.gif'), 
                        image: NetworkImage(fotoAnuncio))
                    )),
                    Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 20),
                  child: Text("Descripcion",style: TextStyle(fontFamily: 'GilroyB'),textAlign: TextAlign.left,),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 0),
                  child: Container(
                    child: Text(descLarga,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontFamily: 'GilroyL'),
                    textAlign: TextAlign.left,),
                  ),
                  )
                // Padding(
                //   padding: const EdgeInsets.only(left: 10, right: 10),
                //   child: Row(
                //     children: [
                //       Container(
                //         width: 60,
                //         height: 60,
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             image: DecorationImage(
                //                 image: AssetImage('assets/img/yuriña2.jpg'))),
                //       ),
                //       Expanded(
                //         child: ListTile(
                //           title: Text(
                //             'Yuriña -  tejidos con altura',
                //             style: TextStyle(fontFamily: 'GilroyB'),
                //           ),
                //           subtitle: Row(
                //             children: [
                //               Icon(
                //                 Icons.star,
                //                 size: 10,
                //                 color: Color(0XFFFFC600),
                //               ),
                //               Icon(
                //                 Icons.star,
                //                 size: 10,
                //                 color: Color(0XFFFFC600),
                //               ),
                //               Icon(
                //                 Icons.star,
                //                 size: 10,
                //                 color: Color(0XFFFFC600),
                //               ),
                //               Icon(
                //                 Icons.star,
                //                 size: 10,
                //                 color: Color(0XFFFFC600),
                //               ),
                //               Icon(
                //                 Icons.star_border,
                //                 size: 10,
                //                 color: Color(0XFFFFC600),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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