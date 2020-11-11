import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pymbo/src/service/admod_service.dart';
import 'package:pymbo/src/ui/ofertas/ofertas_screen.dart';
import 'package:pymbo/src/ui/principal/principal_screen.dart';
import 'package:pymbo/src/ui/search/search_screen.dart';
import 'package:pymbo/src/ui/setting/setting_screen.dart';

import 'eventos/event_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //HomeScreen({Key key, @required this.name}) : super(key: key);

  final ams = AdmodService();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Admob.initialize(ams.getAppId());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      PrincipalScreen(),
      SearchScreen(),
      OfertaScreen(),
      EventScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                    gap: 10,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.grey[800],
                    tabs: [
                      buttonNavBar('Inicio', Icons.home, Color(0XFF1D3557),
                          Color(0XFFE63946)),
                      buttonNavBar('Buscar', Icons.search, Color(0XFF1D3557),
                          Color(0XFFE63946)),
                      buttonNavBar('Ofertas', Typicons.tags, Color(0XFF1D3557),
                          Color(0XFFE63946)),
                      buttonNavBar('Eventos', Typicons.calendar,
                          Color(0XFF1D3557), Color(0XFFE63946)),
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
              AdmobBanner(
                  adUnitId: ams.getBannerAdUnitId(),
                  adSize: AdmobBannerSize.FULL_BANNER)
            ],
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
      textStyle: TextStyle(fontFamily: 'GilroyB', color: Colors.white),
      backgroundColor: bgColor,
    );
  }
}
