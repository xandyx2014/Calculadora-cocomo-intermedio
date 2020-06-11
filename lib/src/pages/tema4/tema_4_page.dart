import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/tema_page_widget.dart';


class TemaCuatroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemaPageWidget(
      urlBackgroundImage: 'assets/frases-levantar-animo.jpg', 
      urlPdf: 'assets/UNIDAD_4.pdf',
      tituloPagina: 'Cocomo Basico',
    );
  }
}