import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listanumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;
  ScrollController _scrollControler = new ScrollController();

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollControler.addListener(() {
      if (_scrollControler.position.pixels ==
          _scrollControler.position.maxScrollExtent) {
        // _agregar10();
        fetchdata();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        backgroundColor: Colors.grey,
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollControler,
        itemCount: _listanumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listanumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listanumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listanumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchdata() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollControler.animateTo(
      _scrollControler.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
