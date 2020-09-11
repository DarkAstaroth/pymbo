import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';
import 'package:pymbo/src/ui/favorite/favorite_screen.dart';
import 'package:pymbo/src/ui/principal/principal_screen.dart';
import 'package:pymbo/src/ui/search/search_screen.dart';
import 'package:pymbo/src/ui/setting/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //HomeScreen({Key key, @required this.name}) : super(key: key);

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    PrincipalScreen(),
    SearchScreen(),
    FavoriteScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  buttonNavBar('Inicio', Icons.home, Color(0XFF1D3557),
                      Color(0XFFE63946)),
                  buttonNavBar('Buscar', Icons.search, Color(0XFF1D3557),
                      Color(0XFFE63946)),
                  buttonNavBar('Favoritos', Icons.favorite, Color(0XFF1D3557),
                      Color(0XFFE63946)),
                  buttonNavBar('Ajustes', Icons.settings, Color(0XFF1D3557),
                      Color(0XFFE63946)),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

  Widget buttonNavBar(
      String text, IconData icon, Color iconColor, Color bgColor) {
    return GButton(
      icon: icon,
      iconColor: iconColor,
      text: text,
      textStyle: TextStyle(
        fontFamily: 'GilroyB',
        color: Colors.white
      ),
      backgroundColor: bgColor,
    );
  }
}
