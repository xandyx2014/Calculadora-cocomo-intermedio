import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/models/punto_funcion_model.dart';
class ColumnaSeleccionable extends StatefulWidget {
  final Function(int value, MedidaPuntoFucion tipo) accion;
  final String titulo;
  ColumnaSeleccionable( {this.accion, this.titulo});
  @override
  _ColumnaSeleccionableState createState() => _ColumnaSeleccionableState();
}

class _ColumnaSeleccionableState extends State<ColumnaSeleccionable> {
  MedidaPuntoFucion seleccion = MedidaPuntoFucion.media;
  int valor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
            child: Column(children: <Widget>[
              ListTile(
                title: Text(widget.titulo),
                subtitle: Text('seleccione uno'),
              ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              
              keyboardType: TextInputType.number,
              validator: (value) {
                print(value);
                if (value.isEmpty) {
                  return 'Por favor escribe algun texto';
                }
                if (int.parse(value) <= 0) {
                  return 'El valor tiene q mayor a 0';
                }
                return null;
              },
              onChanged: (value) {
                // print(value);
                this.valor = int.parse(value);
                widget.accion(this.valor, this.seleccion);
              },
              decoration: InputDecoration(
                  // icon: Icon(Icons.book),
                  // prefixIcon: Icon(Icons.border_color),
                  hintText: 'Escribe su nombre',
                  labelText: 'Entrada externa'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: 'media',
              validator: (String value) {
                print(value);
                if (value == null) {
                  return 'Selecciona un item';
                }
                return null;
              },
              items: [
                DropdownMenuItem<String>(
                  child: Text('Baja'),
                  value: 'baja',
                ),
                DropdownMenuItem<String>(
                  child: Text('Media'),
                  value: 'media',
                ),
                DropdownMenuItem<String>(
                  child: Text('Alta'),
                  value: 'alta',
                ),
              ],
              onChanged: (String value) {
                setState(() {
                  if (value == 'baja') {
                    this.seleccion = MedidaPuntoFucion.baja;
                  }
                  if(value == 'media') {
                    this.seleccion = MedidaPuntoFucion.media;
                  }
                  if (value == 'alta') {
                    this.seleccion = MedidaPuntoFucion.alta;
                  }
                  // this.valor = int.parse(value);
                  widget.accion(this.valor, this.seleccion);
                  print(this.seleccion);
                });

              },
              // isExpanded: true,
              hint: Text('Selecciona uno'),
              // value: _value,
            ),
          ),
        ]),
      ),
    );
  }
}

