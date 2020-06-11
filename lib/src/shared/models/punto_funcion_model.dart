import 'package:flutter/material.dart';

enum MedidaPuntoFucion {
  baja,
  media,
  alta
}
class PuntoFuncion extends ChangeNotifier {
  int _entradaExterna = 0;
  int _salidaExterna = 0;
  int _consultaExterna = 0;
  int _archivoLogicoInterno = 0;
  int _interfacesExternas = 0;
  int _puntoFuncionSinAjustar = 0;
  int get entradaExternaGet => this._entradaExterna;
  void entradaExterna({int value = 0 , MedidaPuntoFucion tipo}) {
    this._entradaExterna = 0;
    if (tipo == MedidaPuntoFucion.baja) {
      this._entradaExterna = value * 7;
    }  
    if (tipo == MedidaPuntoFucion.media) {
      this._entradaExterna = value * 10;
    }  
    if (tipo == MedidaPuntoFucion.alta) {
      this._entradaExterna = value * 15;
    }
      
    this.notifyListeners();
  }
  void salidaExterna({int value = 0 , MedidaPuntoFucion tipo}) {
    this._salidaExterna = 0;
    if (tipo == MedidaPuntoFucion.baja) {
      this._salidaExterna = value * 5;
    }  
    if (tipo == MedidaPuntoFucion.media) {
      this._salidaExterna = value * 7;
    }  
    if (tipo == MedidaPuntoFucion.alta) {
      this._salidaExterna = value * 10;
    }
    // print( '${this._salidaExterna} salida externa');  
    this.notifyListeners();
  }
  void consultaExterna({int value = 0 , MedidaPuntoFucion tipo}) {
    this._consultaExterna = 0;
    if (tipo == MedidaPuntoFucion.baja) {
      this._consultaExterna = value * 3;
    }  
    if (tipo == MedidaPuntoFucion.media) {
      this._consultaExterna = value * 4;
    }  
    if (tipo == MedidaPuntoFucion.alta) {
      this._consultaExterna = value * 6;
    }
    // print('Consulta externa ${this._consultaExterna}');  
    this.notifyListeners();
  }
  void archivoLogicoInterno({int value = 0 , MedidaPuntoFucion tipo}) {
    this._archivoLogicoInterno = 0;
    if (tipo == MedidaPuntoFucion.baja) {
      this._archivoLogicoInterno = value * 7;
    }  
    if (tipo == MedidaPuntoFucion.media) {
      this._archivoLogicoInterno = value * 10;
    }  
    if (tipo == MedidaPuntoFucion.alta) {
      this._archivoLogicoInterno = value * 15;
    }  
    this.notifyListeners();
  }
  void interfacesExternas({int value = 0 , MedidaPuntoFucion tipo}) {
    this._interfacesExternas = 0;
    if (tipo == MedidaPuntoFucion.baja) {
      this._interfacesExternas = value * 3;
    }  
    if (tipo == MedidaPuntoFucion.media) {
      this._interfacesExternas = value * 4;
    }  
    if (tipo == MedidaPuntoFucion.alta) {
      this._interfacesExternas = value * 6;
    }  
    this.notifyListeners();
  }
  int puntoFucionSInAjustar() {
    this._puntoFuncionSinAjustar = 0;
    this._puntoFuncionSinAjustar = this._entradaExterna + this._salidaExterna + this._consultaExterna + this._archivoLogicoInterno + this._interfacesExternas;
    return this._puntoFuncionSinAjustar;
  }
}