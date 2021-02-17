import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 20.0),
          _cardtipo2(),
          SizedBox(height: 20.0),
          _cardtipo3(),
          _cardTipo1(),
          SizedBox(height: 20.0),
          _cardtipo2(),
          SizedBox(height: 20.0),
          _cardtipo3(),
          _cardTipo1(),
          SizedBox(height: 20.0),
          _cardtipo2(),
          SizedBox(height: 20.0),
          _cardtipo3(),
          _cardTipo1(),
          SizedBox(height: 20.0),
          _cardtipo2(),
          SizedBox(height: 20.0),
          _cardtipo3(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Tarjeta2'),
            subtitle: Text('cosas que pasan y pasan que cosas'),
            leading: Icon(Icons.photo_album, color: Colors.blue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: () {}, child: Text('Cancelar')),
              FlatButton(onPressed: () {}, child: Text('ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardtipo2() {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Tarjeta2'),
            subtitle:
                Text('Sabias que esta tarjeta es mas dificil? solo pulsala'),
            leading: Icon(Icons.wysiwyg, color: Colors.blue),
            onLongPress: () {},
          ),
        ],
      ),
    );
  }

  Widget _cardtipo3() {
    final _card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('Solo tengo que decir algo'),
            padding: EdgeInsets.all(20),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: _card,
      ),
    );
  }
}
