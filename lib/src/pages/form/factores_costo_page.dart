import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/models/factor_costo_model.dart';
import 'package:ing_software/src/shared/widgets/custom_field_widget.dart';
import 'package:ing_software/src/shared/widgets/drawer_widget.dart';
import 'package:ing_software/src/shared/widgets/factor_costo_widget.dart';
import 'package:provider/provider.dart';

class FactorCostoPage extends StatefulWidget {
  @override
  _FactorCostoPageState createState() => _FactorCostoPageState();
}

class _FactorCostoPageState extends State<FactorCostoPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  double volumenBaseDatos = 1;
  double volumenAplicacion = 1;
  @override
  Widget build(BuildContext context) {
    final factorCosto = Provider.of<ListaFactorCosto>(context);
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Factores de costo'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          InputValueCustom(
            titulo: 'Volumen Base datos',
            subtitulo: 'Ingrese su valor porfa vor',
            onChange: (value) {
              this.volumenBaseDatos = double.parse(value);
              factorCosto.tamagnooBaseDatos(
                volumenBaseDatos: this.volumenBaseDatos,
                volumenAplicacion: this.volumenAplicacion
              );
              // print(value);
            },
          ),
          InputValueCustom(
            titulo: 'Volumen de la Aplicacion',
            subtitulo: 'Ingrese su valor porfa vor',
            onChange: (value) {
              this.volumenAplicacion = double.parse(value);
              factorCosto.tamagnooBaseDatos(
                volumenBaseDatos: this.volumenBaseDatos,
                volumenAplicacion: this.volumenAplicacion
              );
              // print(value);
            },
          ),
          FactorCosto(
            titulo: 'Fiabilidad requerida del software',
            valores: Valores(
              valueMuyBajo: 0.75,
              valueBajo: 0.88,
              valueNormal: 1,
              valueAlto: 1.15,
              valueMuyAlto: 1.4
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              print('Fiabilidad required del software $value');
              factorCosto.fiabilidadRequeridaSoftware(value);
            },
          ),
          /*FactorCosto(
            titulo: 'Tamaño de la base de datos',
            valores: Valores(
              valueBajo: 0.94,
              valueNormal: 1.00,
              valueAlto: 1.08,
              valueMuyAlto: 1.16
            ),
            showCampos: ShowValores(
              showMuyBajo: false,
              showExtraAlto: false
            ),
            obtenerValor: (double value) {

              print('Tamaño de la base de datos $value');
            },
          )*/
          FactorCosto(
            titulo: 'Complejidad del producto ',
            valores: Valores(
              valueMuyBajo: 0.7,
              valueBajo: 0.85,
              valueNormal: 1,
              valueAlto: 1.15,
              valueMuyAlto: 1.3,
              valueExtraAlto: 1.65
            ),
            showCampos: ShowValores(),
            obtenerValor: (double value) {
              factorCosto.complejidadProducto(value);
              print('Complejidad del producto $value');
            },
          ),
          FactorCosto(
            titulo: 'Restricciones de tiempo de ejecusion',
            valores: Valores(
              valueNormal: 1,
              valueAlto: 1.11,
              valueMuyAlto: 1.3,
              valueExtraAlto: 1.66
            ),
            showCampos: ShowValores(
              showMuyBajo: false,
              showBajo: false
            ),
            obtenerValor: (double value) {
              factorCosto.restriccionTiempoEjecucion(value);
              print('Restricciones de tiempo de ejecusion $value');
            },
          ),
          FactorCosto(
            titulo: 'Restricciones de memoria virtual',
            valores: Valores(
              valueNormal: 1,
              valueAlto: 1.06,
              valueMuyAlto: 1.21,
              valueExtraAlto: 0.156
            ),
            showCampos: ShowValores(
              showMuyBajo: false,
              showBajo: false
            ),
            obtenerValor: (double value) {
              factorCosto.restriccionMemoriaVirtual(value);
              print('Restricciones de memoria virtual $value');
            },
          ),
          // FALTA COMPLETAR ------------------------------------
          FactorCosto(
            titulo: 'Volatilidad en la maquina virtual',
            valores: Valores(
              valueBajo: 0.87,
              valueNormal: 1,
              valueAlto: 1.15,
              valueMuyAlto: 1.3
            ),
            showCampos: ShowValores(
              showMuyAlto: false,
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.volatibilidadMaquinaVirtual(value);
              print('Volatildiad en la maquina virtual $value');
            },
          ),
          FactorCosto(
            titulo: 'Tiempo de respuesta ',
            valores: Valores(
              valueBajo: 0.87,
              valueNormal: 1,
              valueAlto: 1.07,
              valueMuyAlto: 1.15
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.tiempoRespuesta(value);
              print('Tiempo de respuesta $value');
            },
          ),
          FactorCosto(
            titulo: 'Capacidad de analisis',
            valores: Valores(
              valueMuyBajo: 1.46,
              valueBajo: 1.19,
              valueNormal: 1,
              valueAlto: 0.86,
              valueMuyAlto: 0.71
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.capacidadAnalisis(value);
              print('Capacidad de analisis $value');
            },
          ),
          FactorCosto(
            titulo: 'Experiencia de aplicacion',
            valores: Valores(
              valueMuyBajo: 1.29,
              valueBajo: 1.13,
              valueNormal: 1,
              valueAlto: 0.91,
              valueMuyAlto: 0.82,
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.experienciaAplicacion(value);
              print('Experiencia de aplicacion $value');
            },
          ),
          FactorCosto(
            titulo: 'Calidad de programadores',
            valores: Valores(
              valueMuyBajo: 1.42,
              valueBajo: 1.17,
              valueNormal: 1,
              valueAlto: 0.86,
              valueMuyAlto: 0.7
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.calidadProgramadores(value);
              print('Calidad de programadores $value');
            },
          ),
          FactorCosto(
            titulo: 'Experiencia en la maquina virtual',
            valores: Valores(
              valueMuyBajo: 1.21,
              valueBajo: 1.1,
              valueNormal: 1,
              valueAlto: 0.9
            ),
            showCampos: ShowValores(
              showMuyAlto: false,
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.experienciaMaquinaVirtual(value);
              print('Experiencia en la maquina virtual $value');
            },
          ),
          FactorCosto(
            titulo: 'Experiencia en el lenguaje ',
            valores: Valores(
              valueMuyBajo: 1.14,
              valueBajo: 1.07,
              valueNormal: 1,
              valueAlto: 0.95
            ),
            showCampos: ShowValores(
              showMuyAlto: false,
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.experienciaLenguaje(value);
              print('Experiencia en el lenguaje $value');
            },
          ),
          FactorCosto(
            titulo: 'Tecnicas actualizadas de programacion',
            valores: Valores(
              valueMuyBajo: 1.24,
              valueBajo: 1.1,
              valueNormal: 1,
              valueAlto: 0.91,
              valueMuyAlto: 0.82
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.tecnicasActualizadasProgramacion(value);
              print('Tecnicas actualizadas de programacion $value');
            },
          ),
          FactorCosto(
            titulo: 'Utilizacion de herramienta de software ',
            valores: Valores(
              valueMuyBajo: 1.21,
              valueBajo: 1.08,
              valueNormal: 1.0,
              valueAlto: 0.91,
              valueExtraAlto: 0.83
            ),
            showCampos: ShowValores(
               showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.utilizacionHerramientaSoftware(value);
              print('Utilizacion de herramienta de software $value');
            },
          ),
          FactorCosto(
            titulo: 'Restricciones de desarrollo',
            valores: Valores(
              valueMuyBajo: 1.24,
              valueBajo: 1.1,
              valueNormal: 1,
              valueAlto: 1.04,
              valueMuyAlto: 1.1
            ),
            showCampos: ShowValores(
              showExtraAlto: false
            ),
            obtenerValor: (double value) {
              factorCosto.restriccionesDesarrollo(value);
              print('Restricciones de desarrollo $value');
            },
          ),
          Container(
            child: Card(
              child: ListTile(
                title: Text('Factor de costo'),
                subtitle: Text('${factorCosto.factorCosto()}'),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            width: double.maxFinite,
            child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('resultado-costo');
                },
                child: Text('Siguiente', style: TextStyle( color: Colors.white),),
              ),
          )
        ],
      )),
    );
  }
}


