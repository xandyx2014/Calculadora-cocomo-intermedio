import 'package:flutter/material.dart';
class TipoProyecto {
  String nombre;
  double a;
  double b;
  double c;
  double d;
  TipoProyecto({this.nombre, this.a, this.b, this.c, this.d});
}
class TipoProyectoProvider with ChangeNotifier {
  TipoProyecto _tipoProyecto = TipoProyecto(nombre: 'ORGANICO', a: 2.4, b: 1.05, c: 2.5, d: 0.38);
  TipoProyecto get tipoProyecto => this._tipoProyecto;

  set tipoProyecto(TipoProyecto value) {
    this._tipoProyecto = value;
    notifyListeners();
  }
}