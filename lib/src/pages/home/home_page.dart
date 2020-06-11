import 'package:flutter/material.dart';
import 'package:ing_software/src/shared/models/paginas_model.dart';
import 'package:ing_software/src/shared/widgets/drawer_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  _openDrawer() {
    _drawerKey.currentState.openDrawer();
  }

  final List<Map> paginas = paginasList;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(Icons.reorder), onPressed: this._openDrawer),
        title: Text('Inicio'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: size.height * 0.80,
          child: Swiper(
            itemWidth: size.width * 0.70,
            itemCount: this.paginas.length,
            layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context, int index) {
              return CartaHome(size: size, paginas: paginas, index: index);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.of(context).pushNamed('form'),
        child: Icon(Icons.add),
      ),
    );
  }
}

class CartaHome extends StatelessWidget {
  const CartaHome({
    Key key,
    @required this.size,
    @required this.index,
    @required this.paginas,
  }) : super(key: key);
  final int index;
  final Size size;
  final List<Map> paginas;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Card(
        // color: Theme.of(context).primaryColor.withOpacity(0.9),
        elevation: 20,
        child: Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: Card(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      paginas[index]['imagen'],
                    ),
                    /* CachedNetworkImage(
                      placeholder: (context, url) => CircularProgressIndicator(),
                      imageUrl: 'https://picsum.photos/250?image=9',
                    ), */
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(paginas[index]['titulo']),
                          subtitle: Text('Calculadora de ${paginas[index]['titulo']}'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: double.maxFinite,
                          height: 40.0,
                          child: MaterialButton(
                              color: Colors.pinkAccent,
                              onPressed: () => Navigator.of(context).pushNamed( paginas[index]['route']),
                              child: Text('Calcular',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ))),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
