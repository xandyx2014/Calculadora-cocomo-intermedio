import 'package:flutter/material.dart';
import 'package:ing_software/src/pages/cocomoBasico/cocomo_basico_page.dart';
import 'package:ing_software/src/pages/cocomoIntermedio/cocomo_intermedio_page.dart';
import 'package:ing_software/src/pages/form/factores_costo_page.dart';
import 'package:ing_software/src/pages/form/form_page.dart';
import 'package:ing_software/src/pages/form/resultado_costo_page.dart';
import 'package:ing_software/src/pages/home/home_page.dart';
import 'package:ing_software/src/pages/resultado/resultado_page.dart';
import 'package:ing_software/src/pages/tema/tema_page.dart';
import 'package:ing_software/src/pages/tema2/tema_2_page.dart';
import 'package:ing_software/src/pages/tema3/tema_3_page.dart';
import 'package:ing_software/src/pages/tema4/tema_4_page.dart';
import 'package:ing_software/src/pages/tema5/tema_5_page.dart';
Map<String, WidgetBuilder> routeApp = {
        '': (BuildContext _) => HomePage(),
        'form': (BuildContext _ ) => FormPage(),
        'tema': (BuildContext _) => TemaPage(),
        'tema2': (BuildContext _) => TemaDosPage(),
        'tema3': (BuildContext _) => TemaTresPage(),
        'tema4': (BuildContext _) => TemaCuatroPage(),
        'tema5': (BuildContext _) => TemaCincoPage(),
        'resultado': (BuildContext _) => ResultadoPage(),
        'cocomo-basico': (BuildContext _) => CocomoBasicoPage(),
        'cocomo-intermedio': (BuildContext _) => CocomoIntermedioPage(),
        'factor-costo': (BuildContext _ ) => FactorCostoPage(),
        'resultado-costo': (BuildContext _ ) => ResultadoCostoPage(),
};