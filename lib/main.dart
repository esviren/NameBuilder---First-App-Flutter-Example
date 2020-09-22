import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//import 'package:list_spanish_words/list_spanish_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienbenida a Flutter',
      home: PalabrasAleatorias(),
    );
  }
}

class PalabrasAleatorias extends StatefulWidget {
  @override
  _PalabrasAleatoriasState createState() => _PalabrasAleatoriasState();
}

class _PalabrasAleatoriasState extends State<PalabrasAleatorias> {
  final _sugerensias = <WordPair>[];
  final _fuenteGrande = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de nombres para Startup'),
      ),
      body: _buildSugerencias(),
    );
    final palabrasPares = WordPair.random();
    return Text(palabrasPares.asPascalCase);
  }

  Widget _buildSugerencias() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _sugerensias.length) {
            _sugerensias.addAll(generateWordPairs().take(10));
          }
          return _constructorFila(_sugerensias[index]);
        });
  }

  Widget _constructorFila(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fuenteGrande,
      ),
    );
  }
}
