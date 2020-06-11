import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/models/punto_funcion_model.dart';
import 'package:ing_software/src/shared/widgets/columna_seleccionable_widget.dart';
import 'package:ing_software/src/shared/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  /* _openDrawer() {
    _drawerKey.currentState.openDrawer();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Calcular'),
      ),
      body: FormularioRegistro(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Icon(Icons.home),
      ),
    );
  }
}

class FormularioRegistro extends StatefulWidget {
  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  final puntoFuncion = Provider.of<PuntoFuncion>(context);
    return SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ColumnaSeleccionable(titulo: 'Entrada externa', accion: (value, tipo) {
              puntoFuncion.entradaExterna(value: value, tipo: tipo);
              print('${puntoFuncion.entradaExternaGet} entrada externa get' );
            }),
            ColumnaSeleccionable(titulo: 'Salida externa', accion: (value, tipo) {
              puntoFuncion.salidaExterna(value: value, tipo: tipo);
              print('${puntoFuncion.entradaExternaGet} entrada externa get' );
            }),
            ColumnaSeleccionable(titulo: 'Consulta externa', accion: (value, tipo) {
              puntoFuncion.consultaExterna(value: value, tipo: tipo);
              print('${puntoFuncion.entradaExternaGet} entrada externa get' );
            }),
            ColumnaSeleccionable(titulo: 'Archivo logico interno', accion: (value, tipo) {
              puntoFuncion.archivoLogicoInterno(value: value, tipo: tipo);
              print('${puntoFuncion.entradaExternaGet} entrada externa get' );
            }),
            ColumnaSeleccionable(titulo: 'Interfaces externa', accion: (value, tipo) {
              puntoFuncion.interfacesExternas(value: value, tipo: tipo);
              print('${puntoFuncion.entradaExternaGet} entrada externa get' );
            }),
            Card(
              elevation: 8,
              child: ListTile(
                title: Text('Total PFSA ${puntoFuncion.puntoFucionSInAjustar()}'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                width: double.maxFinite,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    // devolverá true si el formulario es válido, o falso si
                    // el formulario no es válido.
                    if (_formKey.currentState.validate()) {
                      // Si el formulario es válido, queremos mostrar un Snackbar
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('PFSA ${puntoFuncion.puntoFucionSInAjustar()}')));
                      print(puntoFuncion.puntoFucionSInAjustar());
                      Navigator.of(context).pushNamed('factor-costo');
                    }
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
