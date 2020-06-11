import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image(image: AssetImage('assets/cover.png')),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Tema 1'),
                      subtitle: Text('Introduccion a la ingeneria Software'),
                      onTap: () => {Navigator.of(context).pushNamed('tema')},
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Tema 2'),
                      subtitle: Text('Proceso de desarollo de Software'),
                      onTap: () => {Navigator.of(context).pushNamed('tema2')},
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Tema 3'),
                      subtitle: Text('Metrica por punto de Funcion'),
                      onTap: () => {Navigator.of(context).pushNamed('tema3')},
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Tema 4'),
                      subtitle: Text('Cocomo basico'),
                      onTap: () => {Navigator.of(context).pushNamed('tema4')},
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('Tema 5'),
                      subtitle: Text('Cocomo Intermedio'),
                      onTap: () => {Navigator.of(context).pushNamed('tema5')},
                    ),
                    ListTile(
                      leading: Icon(Icons.verified_user),
                      title: Text('Calculadora Cocomo'),
                      subtitle: Text('Cocomo basico-intermedio'),
                      onTap: () => {Navigator.of(context).pushNamed('form')},
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                    ListTile(
                      leading: Icon(Icons.border_color),
                      title: Text('Feedback'),
                      onTap: () => {Navigator.of(context).pop()},
                    ),
                  ],
                ),
              ),
            ),
          ),

          /* ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ), */
        ],
      ),
    );
  }
}
