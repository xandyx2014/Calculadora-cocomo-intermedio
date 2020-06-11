import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bot_toast/bot_toast.dart';
class ListaWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return SlideItem(index: index);
        },
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem({this.index});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.book),
            foregroundColor: Colors.white,
          ),
          title: Text('Titulo n ${index + 1}°.'),
          subtitle: Text('lorem Ipsun dolor'),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Ver',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () {
            // BotToast.showSimpleNotification(title: "Creado exitosamente 😽",);
            Navigator.of(context).pushNamed('resultado');
          },
        ),
        /* IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {},
        ), */
      ],
      secondaryActions: <Widget>[
        /* IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () {},
        ), */
        IconSlideAction(
          caption: 'Borrar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            BotToast.showText(text:"Item $index Borrado " );
          },
        ),
      ],
    );
  }
}
