import 'package:flutter/material.dart';
import 'package:ing_software/src/route.dart';
import 'package:ing_software/src/shared/models/factor_costo_model.dart';
import 'package:ing_software/src/shared/models/kloc_model.dart';
import 'package:ing_software/src/shared/models/punto_funcion_model.dart';
import 'package:ing_software/src/shared/models/tipo_proyecto_model.dart';

import 'package:ing_software/src/shared/theme/theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PuntoFuncion()),
        ChangeNotifierProvider(create: (context) => ListaFactorCosto()),
        ChangeNotifierProvider(create: (context) => Klock()),
        ChangeNotifierProvider(create: (context) => TipoProyectoProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: '',
          routes: routeApp,
          theme: miTema,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()]),
    );
  }
}
