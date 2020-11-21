import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingOptions extends StatefulWidget {
  SettingOptions({Key key}) : super(key: key);

  @override
  _SettingOptionsState createState() => _SettingOptionsState();
}

class _SettingOptionsState extends State<SettingOptions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: SettingsList(
                backgroundColor: Color(0XFFF1FAEE),
                sections: [
                  SettingsSection(
                    title: 'Opciones Administrador',
                    tiles: [
                      settingsTileDefault('Categorias', null, Typicons.tag,'/admin_categorias'),
                    ],
                  ),
                  SettingsSection(
                    title: 'Preferencias',
                    tiles: [
                      settingsTileDefault('Idioma', 'Español', Typicons.globe,''),
                    ],
                  ),
                  SettingsSection(
                    title: 'Ayuda',
                    tiles: [
                      settingsTileDefault(
                          '¿ Cómo funciona pymbo?', null, Typicons.heart,''),
                      settingsTileDefault(
                          'Preguntas Frecuentes', null, Typicons.thumbs_up,''),
                      settingsTileDefault(
                          'Terminos y condiciones', null, Typicons.doc,''),
                    ],
                  ),
                  SettingsSection(
                    title: 'Cuenta',
                    tiles: [
                      settingsTileDefault(
                          'Cambiar Contraseña', null, Typicons.lock,''),
                      settingsTileRed(
                        'Cerrar Sesión',
                        Typicons.export_icon,
                      ),
                    ],
                  ),
                ],
              ),
            );
  }

    Widget settingsTileRed(String text, IconData icono) {
    return SettingsTile(
      title: text,
      titleTextStyle: TextStyle(
          fontFamily: 'GilroyB', fontSize: 15, color: Color(0XFFE63946)),
      leading: Icon(
        icono,
        color: Color(0XFFE63946),
      ),
      onTap: () {
        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
      },
    );
  }

    Widget settingsTileDefault(String text, String subText, IconData icono,String route) {
    return SettingsTile(
      title: text,
      subtitle: subText,
      titleTextStyle: TextStyle(
        fontFamily: 'GilroyL',
        fontSize: 15,
      ),
      leading: Icon(
        icono,
        color: Color(0XFF1D3557),
      ),
      onTap: () {
       Navigator.of(context).pushNamed(route);
      },
    );
  }
}