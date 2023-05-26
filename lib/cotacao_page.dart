import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/* '/cotacao': (context) => const Cotacao(), */
class Cotacao extends StatelessWidget {
  const Cotacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cotacao!!!")),
        body: const Text("Veja a cotaÇão"));
  }
}

//!Método que vai acessar os dados via API.
Future<Map> getData() async {
  var url = Uri.parse('https://api.hgbrasil.com/finance?format=json&key=2abee24e');
  http.Response response = await http.get(url);
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  return json.decode(response.body);
}


//! Criação da tela com estado dinâmico
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
 //_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState {}


//! Criação do estado da tela dinâmica
class _MyHomePageState extends State<Home> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar = 0.0;
  double euro = 0.0;

Void Callback?_realChanged(String text){
  double real = double.parse(text);
  dolarController.text=(real/dolar).toStringAsFixed(2);
  euroController.text=(real/euro).toStringAsFixed(2);}


}


