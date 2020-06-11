import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/tema_page_widget.dart';


class TemaCincoPage extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return TemaPageWidget(
      urlBackgroundImage: 'assets/salmos-34-4.jpg', 
      urlPdf: 'assets/UNIDAD_5.pdf',
      tituloPagina: 'Cocomo Intermedio',
    );
  }
}