import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:pymbo/src/bloc/authentication_bloc/bloc.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_bloc.dart';
import 'package:pymbo/src/bloc/simple_bloc_delegate.dart';
import 'package:pymbo/src/repository/negocio_repository.dart';
import 'package:pymbo/src/repository/user_repository.dart';
import 'package:pymbo/src/ui/favorite/favorite_screen.dart';
import 'package:pymbo/src/ui/home_screen.dart';
import 'package:pymbo/src/ui/login/login_screen.dart';
import 'package:pymbo/src/ui/negocio/mi_negocio.dart';
import 'package:pymbo/src/ui/negocio/crear_perfil_negocio.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:pymbo/src/bloc/negocio_bloc/negocio_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted()),
      ),
      BlocProvider<NegocioBloc>(
        create: (context) => NegocioBloc(negocioRepository: NegocioRepository())
          ..add(LoadNegocio()),
      ),
    ],
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/favoritos': (BuildContext context) => new FavoriteScreen(),
          '/mi_negocio': (BuildContext context) => new MiNegocio(),
          '/add-perfil-negocio': (BuildContext context) =>
              new CrearPerfilNegocio(
                onSave: (portadaImage,
                    profileImage,
                    nombre,
                    descCorta,
                    descLarga,
                    categoria,
                    subCategoria,
                    direccion,
                    telefono,
                    email) {
                  BlocProvider.of<NegocioBloc>(context).add(AddNegocio(
                      portadaImage,
                      profileImage,
                      nombre,
                      descCorta,
                      descLarga,
                      categoria,
                      subCategoria,
                      direccion,
                      telefono,
                      email));
                },
              ),
        },
        home: SplashScreen(
          seconds: 5,
          loaderColor: Color(0XFFE63946),
          imageBackground: AssetImage('assets/img/splash1.jpg'),
          navigateAfterSeconds:
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return HomeScreen();
              }
              if (state is UnAuthenticated) {
                return LoginScreen(
                  userRepository: _userRepository,
                );
              }
              return Container();
            },
          ),
        ));
  }
}
