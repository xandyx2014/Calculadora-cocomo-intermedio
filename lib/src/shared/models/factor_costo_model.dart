import 'package:flutter/material.dart';

class ListaFactorCosto with ChangeNotifier {
  double _fiabilidadRequeridaSoftware = 1;
  double _tamagnooBaseDatos = 1;
  double _complejidadProducto = 1;
  double _restriccionTiempoEjecucion = 1;
  double _restriccionMemoriaVirtual = 1;
  double _volatibilidadMaquinaVirtual = 1;
  double _tiempoRespuesta = 1;
  double _capacidadAnalisis = 1;
  double _experienciaAplicacion = 1;
  double _calidadProgramadores = 1;
  double _experienciaMaquinaVirtual = 1;
  double _experienciaLenguaje = 1;
  double _tecnicasActualizadasProgramacion = 1;
  double _utilizacionHerramientaSoftware = 1;
  double _restriccionesDesarrollo = 1;
  double _factorCosto = 0;
  // double get fiabilidadRequeridaSoftware => _fiabilidadRequeridaSoftware;
  void fiabilidadRequeridaSoftware(double value) {
    this._fiabilidadRequeridaSoftware = 1;
    this._fiabilidadRequeridaSoftware = value;
    notifyListeners();
  } 
  void tamagnooBaseDatos({double volumenBaseDatos = 1, double volumenAplicacion = 1}) {
    final double tamagnoBaseDeDatos = volumenBaseDatos / volumenAplicacion;
    this._tamagnooBaseDatos = 1;
    // this._tamagnooBaseDatos = tamagnoBaseDeDatos;
    // print(tamagnoBaseDeDatos <= 1001);
    if (tamagnoBaseDeDatos >= 0 && tamagnoBaseDeDatos <= 10) {
      this._tamagnooBaseDatos = 0.94;
    } else if(tamagnoBaseDeDatos >= 11 && tamagnoBaseDeDatos <= 100) {
      this._tamagnooBaseDatos = 1;
    } else if(tamagnoBaseDeDatos >= 101 && tamagnoBaseDeDatos <= 1000) {
      this._tamagnooBaseDatos = 1.08;
    } else if(tamagnoBaseDeDatos >= 1001) {
      
      this._tamagnooBaseDatos = 1.16;
    }
    print(this._tamagnooBaseDatos);
    notifyListeners();
  } 
  void complejidadProducto(double value) {
    this._complejidadProducto = 1;
    this._complejidadProducto = value;
    notifyListeners();
  } 
  void restriccionTiempoEjecucion(double value) {
    this._restriccionTiempoEjecucion = 1;
    this._restriccionTiempoEjecucion = value;
    notifyListeners();
  } 
  void restriccionMemoriaVirtual(double value) {
    this._restriccionMemoriaVirtual = 1;
    this._restriccionMemoriaVirtual = value;
    notifyListeners();
  } 
  void volatibilidadMaquinaVirtual(double value) {
    this._volatibilidadMaquinaVirtual = 1;
    this._volatibilidadMaquinaVirtual = value;
    notifyListeners();
  } 
  void tiempoRespuesta(double value) {
    this._tiempoRespuesta = 1;
    this._tiempoRespuesta = value;
    notifyListeners();
  } 
  void capacidadAnalisis(double value) {
    this._capacidadAnalisis = 1;
    this._capacidadAnalisis = value;
    notifyListeners();
  } 
  void experienciaAplicacion(double value) {
    this._experienciaAplicacion = 1;
    this._experienciaAplicacion = value;
    notifyListeners();
  } 
  void calidadProgramadores(double value) {
    this._calidadProgramadores = 1;
    this._calidadProgramadores = value;
    notifyListeners();
  } 
  void experienciaMaquinaVirtual(double value) {
    this._experienciaMaquinaVirtual = 1;
    this._experienciaMaquinaVirtual = value;
    notifyListeners();
  } 
  void experienciaLenguaje(double value) {
    this._experienciaLenguaje = 1;
    this._experienciaLenguaje = value;
    notifyListeners();
  } 
  void tecnicasActualizadasProgramacion(double value) {
    this._tecnicasActualizadasProgramacion = 1;
    this._tecnicasActualizadasProgramacion = value;
    notifyListeners();
  } 
  void utilizacionHerramientaSoftware(double value) {
    this._utilizacionHerramientaSoftware = 1;
    this._utilizacionHerramientaSoftware = value;
    notifyListeners();
  } 
  void restriccionesDesarrollo(double value) {
    this._restriccionesDesarrollo = 1;
    this._restriccionesDesarrollo = value;
    notifyListeners();
  } 
  double factorCosto() {
    this._factorCosto = 
    _fiabilidadRequeridaSoftware
    + _tamagnooBaseDatos
    + _complejidadProducto
    + _restriccionTiempoEjecucion
    + _restriccionMemoriaVirtual
    + _volatibilidadMaquinaVirtual
    + _tiempoRespuesta
    + _capacidadAnalisis
    + _experienciaAplicacion
    + _calidadProgramadores
    + _experienciaMaquinaVirtual
    + _experienciaLenguaje
    + _tecnicasActualizadasProgramacion
    + _utilizacionHerramientaSoftware
    + _restriccionesDesarrollo;
    // notifyListeners();
    return this._factorCosto;
    
  }

}