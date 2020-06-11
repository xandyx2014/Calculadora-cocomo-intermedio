import 'package:flutter/material.dart';

class Valores {
  double valueMuyBajo;
  double valueBajo;
  double valueNormal;
  double valueAlto;
  double valueMuyAlto;
  double valueExtraAlto;
  Valores(
      {this.valueMuyBajo = 1,
      this.valueBajo = 2,
      this.valueNormal = 3,
      this.valueAlto = 4,
      this.valueMuyAlto = 5,
      this.valueExtraAlto = 6});
}

class ShowValores {
  bool showMuyBajo;
  bool showBajo;
  bool showNormal;
  bool showAlto;
  bool showMuyAlto;
  bool showExtraAlto;
  ShowValores(
      {this.showMuyBajo = true,
      this.showBajo = true,
      this.showNormal = true,
      this.showAlto = true,
      this.showMuyAlto = true,
      this.showExtraAlto = true});
}

class FactorCosto extends StatefulWidget {
  final String titulo;
  final String subTitulo;
  final Valores valores;
  final ShowValores showCampos;
  final Function(double value) obtenerValor;
  FactorCosto(
      {@required this.valores,
      @required this.showCampos,
      this.obtenerValor,
      this.titulo = 'titulo de la pagina',
      this.subTitulo = 'Seleccione una opcion'});

  @override
  _FactorCostoState createState() => _FactorCostoState();
}

class _FactorCostoState extends State<FactorCosto> {
  FocusNode _node = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        width: double.maxFinite,
        child: Card(
          elevation: 8,
          child: Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(widget.titulo),
                  subtitle: Text(widget.subTitulo),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Focus(
                    focusNode: _node,
                    onFocusChange: (bool focus) {
                      setState(() {});
                    },
                    child: Listener(
                      onPointerDown: (_) {
                        FocusScope.of(context).requestFocus(_node);
                      },
                      child: DropdownButtonFormField(
                        value: 'normal',
                        validator: (String value) {
                          print(value);
                          if (value == null) {
                            return 'Selecciona un item';
                          }
                          return null;
                        },
                        items: [
                          if (widget.showCampos.showMuyBajo)
                            DropdownMenuItem<String>(
                              child: Text('Muy Bajo'),
                              value: 'muy baja',
                            ),
                          if (widget.showCampos.showBajo)
                            DropdownMenuItem<String>(
                              child: Text('Baja'),
                              value: 'baja',
                            ),
                          if (widget.showCampos.showNormal)
                            DropdownMenuItem<String>(
                              child: Text('Normal'),
                              value: 'normal',
                            ),
                          if (widget.showCampos.showAlto)
                            DropdownMenuItem<String>(
                              child: Text('Alta'),
                              value: 'alta',
                            ),
                          if (widget.showCampos.showMuyAlto)
                            DropdownMenuItem<String>(
                              child: Text('Muy Alta'),
                              value: 'muy alta',
                            ),
                          if (widget.showCampos.showExtraAlto)
                            DropdownMenuItem<String>(
                              child: Text('Extra Alta'),
                              value: 'extra alta',
                            ),
                        ],
                        onChanged: (String value) {
                          setState(() {
                            if (value == 'muy baja') {
                              // final double valor =;
                              widget.obtenerValor(widget.valores.valueMuyBajo);
                            }
                            if (value == 'baja') {
                              // this.seleccion = MedidaPuntoFucion.baja;
                              widget.obtenerValor(widget.valores.valueBajo);
                            }
                            if (value == 'normal') {
                              // this.seleccion = MedidaPuntoFucion.media;
                              widget.obtenerValor(widget.valores.valueNormal);
                            }
                            if (value == 'alta') {
                              // this.seleccion = MedidaPuntoFucion.alta;
                              widget.obtenerValor(widget.valores.valueAlto);
                            }
                            if (value == 'muy alta') {
                              widget.obtenerValor(widget.valores.valueMuyAlto);
                            }
                            if (value == 'extra alta') {
                              widget
                                  .obtenerValor(widget.valores.valueExtraAlto);
                            }
                            // this.valor = int.parse(value);
                            //  widget.accion(this.valor, this.seleccion);
                            // print(this.seleccion);
                          });
                        },
                        // isExpanded: true,
                        hint: Text('Selecciona uno'),
                        // value: _value,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
