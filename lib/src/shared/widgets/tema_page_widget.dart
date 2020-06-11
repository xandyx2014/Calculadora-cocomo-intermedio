import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/drawer_widget.dart';
import 'package:ing_software/src/shared/widgets/sliver_widget.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
class TemaPageWidget extends StatefulWidget {
  final String urlBackgroundImage;
  final String urlPdf;
  final String tituloPagina;
  const TemaPageWidget({ 
    @required this.urlBackgroundImage,
    @required this.urlPdf,
    this.tituloPagina = 'Titulo'});
  @override
  _TemaPageWidgetState createState() => _TemaPageWidgetState();
}

class _TemaPageWidgetState extends State<TemaPageWidget> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool _isLoading = true;
  PDFDocument document;
  @override
  void initState() { 
    super.initState();
    loadDocument();
  }
  loadDocument() async {
    document = await PDFDocument.fromAsset(widget.urlPdf).catchError( (err ) {
      print(err.toString());
    });

    setState(() => _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      key: _drawerKey,
      drawer: DrawerWidget(),
      body: ContenidoPagina(
          titulo: widget.tituloPagina,
          urlImage: widget.urlBackgroundImage,
          // child: CuerpoPagina()
          child: this._isLoading ?
          Center( child: CircularProgressIndicator(),)
          : PDFViewer(
            document: document,
            tooltip: PDFViewerTooltip(
              first: 'Primero',
              previous: 'Anterior',
              next: 'Siguiente',
              last: 'Ultimo',
              pick: 'Selecciona una Pagina',
              jump: 'Saltar'
            )),
      ),
    );
    return scaffold;
  }
}


/* class CuerpoPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              ListTile(
                title: Text(
                  'Introduccion',
                  style: TextStyle(fontSize: 30.0),
                ),
                subtitle: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry  Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(height: 1.4),
                ),
              ),
            ],
          ),
        ));
  }
} */
