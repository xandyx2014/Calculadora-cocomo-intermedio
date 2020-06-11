import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/tema_page_widget.dart';


class TemaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TemaPageWidget(
      urlBackgroundImage: 'assets/salmos-32-8-2.jpg',
      urlPdf: 'assets/UNIDAD_1.pdf',
      tituloPagina: 'Ing Software',
    );
  }
}