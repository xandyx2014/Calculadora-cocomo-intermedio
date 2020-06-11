import 'package:flutter/material.dart';

class InputValueCustom extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final String hintText;
  final Function(String value) onChange;
  final FormFieldValidator<String> validator;
  const InputValueCustom(
      {
      this.titulo = 'Titulo',
      this.subtitulo = 'subtitulo',
      this.hintText = 'hintext',
      this.onChange,
      this.validator});

  @override
  _InputValueCustomState createState() => _InputValueCustomState();
}

class _InputValueCustomState extends State<InputValueCustom> {
  
  @override
  Widget build(BuildContext context) {
    // TextEditingController searchEditor = TextEditingController();
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(this.widget.titulo),
              subtitle: Text(this.widget.subtitulo),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor escribe algun texto';
                      }
                      if (double.parse(value) <= 0) {
                        return 'El valor tiene q mayor a 0';
                      }
                      return null;
                    },
                onChanged: (value) {
                  // controller.clear();
                  this.widget.onChange(value);
                },
                decoration: InputDecoration(
                    // icon: Icon(Icons.book),
                    // prefixIcon: Icon(Icons.border_color),
                    hintText: this.widget.hintText,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  defaultValidation(value) {
    print(value);
    if (value.isEmpty) {
      return 'Por favor escribe algun texto';
    }
    if (double.parse(value) <= 0) {
      return 'El valor tiene q mayor a 0';
    }
    return null;
  }
}
