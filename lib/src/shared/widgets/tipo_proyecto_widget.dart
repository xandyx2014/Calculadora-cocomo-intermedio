import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/models/tipo_proyecto_model.dart';
class ProyectoTipoWidget extends StatelessWidget {
  final List<TipoProyecto> listaProyecto;
  final Function(TipoProyecto value) onChange;
  const ProyectoTipoWidget(
      {@required this.listaProyecto, @required this.onChange});
  @override
  Widget build(BuildContext context) {
    // this.onChange(listaProyecto[0]);
    return Container(
        margin: EdgeInsets.all(8.0),
        child: Card(
          elevation: 8.0,
          child: DropdownButtonFormField(
            // value: listaProyecto[0].nombre,
            validator: (String value) {
              print(value);
              if (value == null) {
                return 'Selecciona un item';
              }
              return null;
            },
            items: List.generate(
                listaProyecto.length,
                (index) => DropdownMenuItem<String>(
                      // onTap: () {},
                      child: Text('${listaProyecto[index].nombre}'),
                      value: '${listaProyecto[index].nombre}',
                    )),
            onChanged: (value) {
              // this.onChange(value);
              final proyect = listaProyecto
                  .where((element) => element.nombre == value)
                  .toList();
              print(proyect[0].nombre);
              this.onChange(proyect[0]);
            },
            // isExpanded: true,
            hint: Text('Selecciona uno'),
            // value: _value,
          ),
        ));
  }
}