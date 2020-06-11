import 'package:flutter/material.dart';

class Klock with ChangeNotifier {
  double _puntoFusion = 0;
  double _loc = 0;
  double _totalKloc = 0;
  double puntoFusion({double puntoFunsionSinAjustar, double factorCosto}) {
    this._puntoFusion = 0;
    this._puntoFusion = (puntoFunsionSinAjustar * (0.65 + (0.01 * factorCosto)));
    return this._puntoFusion;
  }
  loc({double correlacion}) {
    this._loc = 0;
    this._loc = this._puntoFusion * correlacion;
    return this._loc;
  }
  kloc({double kloc}) {
    this._totalKloc = 0;
    this._totalKloc = kloc / 1000;
    notifyListeners();
    return this._totalKloc;
  }
  double get totalKloc => this._totalKloc;
}