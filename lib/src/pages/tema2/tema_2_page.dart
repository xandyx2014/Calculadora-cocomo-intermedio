import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/tema_page_widget.dart';

class TemaDosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemaPageWidget(
      urlBackgroundImage: 'assets/autoestima-2.jpg', 
      urlPdf: 'assets/UNIDAD_2.pdf',
      tituloPagina: 'Proceso de desarrollo',
    );
  }
}