import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();
  String resultado = "";

  bool esPalindromo(String palabra) {
    String limpiada = palabra.toLowerCase().replaceAll(RegExp(r'\s+'), '');
    return limpiada == limpiada.split('').reversed.join('');
  }

  void verificarPalindromo() {
    String texto = _controller.text;
    setState(() {
      resultado =
          esPalindromo(texto)
              ? '"$texto" es un palíndromo'
              : '"$texto" no es un palíndromo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Detector de Palíndromos')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Introduce una palabra'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: verificarPalindromo,
                child: Text('Verificar'),
              ),
              SizedBox(height: 16),
              Text(
                resultado,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
