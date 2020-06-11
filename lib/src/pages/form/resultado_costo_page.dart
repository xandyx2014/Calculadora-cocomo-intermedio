import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/models/factor_costo_model.dart';
import 'package:ing_software/src/shared/models/kloc_model.dart';
import 'package:ing_software/src/shared/models/punto_funcion_model.dart';
import 'package:ing_software/src/shared/models/tipo_proyecto_model.dart';
import 'package:ing_software/src/shared/widgets/custom_field_widget.dart';
import 'package:ing_software/src/shared/widgets/drawer_widget.dart';
import 'package:ing_software/src/shared/widgets/tipo_proyecto_widget.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ResultadoCostoPage extends StatefulWidget {
  @override
  _ResultadoCostoPageState createState() => _ResultadoCostoPageState();
}

class _ResultadoCostoPageState extends State<ResultadoCostoPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  double _puntoFunsionSinAjustar = 0.0;
  double _puntoFunsion = 0.0;
  double _factorCosto = 0.0;
  double _correlacion = 320;
  double _loc = 0;
  double _kloc = 0;
  double esfuerzo = 0;
  double duracion = 0;
  double personal = 0;
  double sueldoDesarrolladores = 0;
  double costoProyecto = 0;
  @override
  Widget build(BuildContext context) {
    final kloc = Provider.of<Klock>(context);
    final puntoFuncion = Provider.of<PuntoFuncion>(context);
    final listafactorCosto = Provider.of<ListaFactorCosto>(context);
    final tipoProyecto = Provider.of<TipoProyectoProvider>(context);
    this.esfuerzo = (tipoProyecto.tipoProyecto.a *
        math.pow(this._kloc, tipoProyecto.tipoProyecto.b));
    this.duracion = tipoProyecto.tipoProyecto.c *
        math.pow(this.esfuerzo, tipoProyecto.tipoProyecto.d);
    this.personal = this.esfuerzo / this.duracion;
    this.costoProyecto =
        this.duracion * this.personal * this.sueldoDesarrolladores;
    final size = MediaQuery.of(context).size;
    this._puntoFunsionSinAjustar =
        puntoFuncion.puntoFucionSInAjustar().toDouble();
    this._factorCosto = listafactorCosto.factorCosto().toDouble();
    this._puntoFunsion = kloc.puntoFusion(
        puntoFunsionSinAjustar: this._puntoFunsionSinAjustar,
        factorCosto: this._factorCosto);
    return Scaffold(
        key: _drawerKey,
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Calcular'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InputValueCustom(
                titulo: 'Sueldo de desarroladores',
                subtitulo: 'escriba numero',
                onChange: (value) {
                  this.sueldoDesarrolladores = double.parse(value);
                  print(this.sueldoDesarrolladores);
                },
              ),
              Correlacion(
                listaLenguaje: [
                  Lenguajes(nombre: 'assembler', correlacion: 320.0),
                  Lenguajes(nombre: 'C', correlacion: 128.0),
                  Lenguajes(nombre: 'Algon', correlacion: 105.001),
                  Lenguajes(nombre: 'Fortran', correlacion: 105.002),
                  Lenguajes(nombre: 'Paascal', correlacion: 105.003),
                  Lenguajes(nombre: 'Rpg', correlacion: 80.0),
                  Lenguajes(nombre: 'Pl/1', correlacion: 80.001),
                  Lenguajes(nombre: 'Modula-2', correlacion: 80.002),
                  Lenguajes(nombre: 'Prolog', correlacion: 64.0),
                  Lenguajes(nombre: 'Lisp', correlacion: 64.001),
                  Lenguajes(nombre: 'Basic', correlacion: 64.002),
                  Lenguajes(nombre: '4gl para BD', correlacion: 40.0),
                  Lenguajes(nombre: 'Apl', correlacion: 32.0),
                  Lenguajes(nombre: 'Smaltak', correlacion: 29.0),
                  Lenguajes(nombre: 'Query', correlacion: 13.0),
                  Lenguajes(nombre: 'SpreadSheet', correlacion: 6.0),
                  Lenguajes(nombre: 'Sql', correlacion: 13.001),
                  Lenguajes(nombre: 'Vb', correlacion: 24.0),
                  Lenguajes(nombre: 'Java', correlacion: 46.0),
                  Lenguajes(nombre: 'Html', correlacion: 14.0),
                  Lenguajes(nombre: 'Delphi', correlacion: 118.0),
                  Lenguajes(nombre: 'C ++', correlacion: 53.0),
                  Lenguajes(nombre: 'COBOL', correlacion: 107.0),
                ],
                onChange: (value) {
                  setState(() {});
                  this._correlacion = double.parse(value);
                  this._loc = kloc.loc(correlacion: this._correlacion);
                  this._kloc = kloc.kloc(kloc: this._loc);
                  print('${this._kloc} klock');

                  print(value);
                },
              ),
              Container(
                width: double.maxFinite,
                child: DataTable(columns: [
                  DataColumn(label: Text('Propiedad')),
                  DataColumn(label: Text('Valor')),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('Punto de fusion sin ajustar')),
                    DataCell(Text('${this._puntoFunsionSinAjustar}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Factor de costo')),
                    DataCell(Text('${this._factorCosto}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Correlacion')),
                    DataCell(Text('${this._correlacion.toStringAsFixed(2)}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Punto de fusion')),
                    DataCell(Text('${this._puntoFunsion.toStringAsFixed(2)}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Loc')),
                    DataCell(Text('${this._loc.toStringAsFixed(2)}')),
                  ]),
                ]),
              ),
              CardResultado(
                titulo: 'Kloc',
                subtitulo: '${this._kloc.toStringAsFixed(3)}',
                width: size.width,
              ),
              ProyectoTipoWidget(
                listaProyecto: [
                  TipoProyecto(
                      nombre: 'ORGANICO', a: 2.4, b: 1.05, c: 2.5, d: 0.38),
                  TipoProyecto(nombre: 'MEDIO', a: 3, b: 1.12, c: 2.5, d: 0.35),
                  TipoProyecto(
                      nombre: 'EMBEBIDO', a: 3.6, b: 1.2, c: 2.5, d: 0.32)
                ],
                onChange: (value) {
                  // setState(() {});
                  tipoProyecto.tipoProyecto = value;
                  print(tipoProyecto.tipoProyecto.nombre);
                  print('${jsonEncode(value.toString())}');
                },
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: DataTable(columns: [
                  DataColumn(label: Text('Propiedad')),
                  DataColumn(label: Text('Valor')),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('Esfuero')),
                    DataCell(Text('${this.esfuerzo.toStringAsFixed(3)}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Duracion')),
                    DataCell(Text('${this.duracion.toStringAsFixed(3)}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Desarrolladores')),
                    DataCell(Text('${this.personal.toStringAsFixed(3)}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      'Costo presupuesto del proyecto',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text('${this.costoProyecto.toStringAsFixed(3)}')),
                  ]),
                ]),
              ),
              Container(
                margin: EdgeInsets.all(15),
                width: double.maxFinite,
                child: MaterialButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Ver cocomo intermedio',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('cocomo-intermedio');
                    }),
              )
            ],
          ),
        ));
  }
}

class Lenguajes {
  String nombre;
  double correlacion;
  Lenguajes({this.nombre, this.correlacion});
}

class Correlacion extends StatefulWidget {
  final List<Lenguajes> listaLenguaje;
  final Function(String value) onChange;

  Correlacion({@required this.listaLenguaje, @required this.onChange});

  @override
  _CorrelacionState createState() => _CorrelacionState();
}

class _CorrelacionState extends State<Correlacion> {
  FocusNode _node = FocusNode();

  @override
  Widget build(BuildContext context) {
    // this.onChange(listaLenguaje[0].correlacion.toString());
    return Container(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                value: widget.listaLenguaje[0].correlacion.toString(),
                validator: (String value) {
                  print(value);
                  if (value == null) {
                    return 'Selecciona un item';
                  }
                  return null;
                },
                items: List.generate(
                    widget.listaLenguaje.length,
                    (index) => DropdownMenuItem<String>(
                          // onTap: () {},
                          child: Text('${widget.listaLenguaje[index].nombre}'),
                          value: '${widget.listaLenguaje[index].correlacion}',
                        )),
                onChanged: (value) {
                  this.widget.onChange(value);
                },
                // isExpanded: true,
                hint: Text('Selecciona uno'),
                // value: _value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardResultado extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final double width;

  const CardResultado(
      {this.titulo = 'Titulo', this.subtitulo = 'Subtitulo', this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10),
        child: ListTile(
          title: Text(this.titulo),
          subtitle: Text(this.subtitulo),
        ),
      ),
    );
  }
}
