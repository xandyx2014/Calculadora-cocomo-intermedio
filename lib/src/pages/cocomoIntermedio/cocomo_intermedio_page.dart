import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/widgets/drawer_widget.dart';


class CocomoIntermedioPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text('Resultado comocomo intermedio'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            DataTable(columns: null, rows: null)
          ],
        ),
      )
   );
  }
}