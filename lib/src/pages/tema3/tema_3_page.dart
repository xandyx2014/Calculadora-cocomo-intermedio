import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/tema_page_widget.dart';



class TemaTresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemaPageWidget(
      urlBackgroundImage: 'assets/filipenses-4-9.jpg', 
      urlPdf: 'assets/UNIDAD_3.pdf',
      tituloPagina: 'Metrica Punto de función',
    );
  }
}