import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

/* void main() async {
  //Alterar para método assíncrono
  runApp(const Cotacao2());
} */

class Cotacao2 extends StatelessWidget {
  const Cotacao2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.red,
        //primaryColor: Colors.white,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 37, 37)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversor de Moedas'),
    );
  }
}

//Método que vai acessar os dados via API
// determina que uma função irá retornar algo no “futuro”, ou seja, é uma função que levará um tempo até ser finalizada
Future<Map> getData() async {
  //var url =
  //Uri.parse('https://api.hgbrasil.com/finance?format=json&key=611517b7');
  var url = Uri.parse('https://api.hgbrasil.com/finance?key=2abee24e');
  //! CHAVE DE ACESSO A API */

  //AWAIT - serve para determinar que o aplicativo deve esperar uma resposta de uma função antes de continuar a execução.
  http.Response response = await http.get(url); //! ARMAZENA NA VARIAVEL*/
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${response.body}');
  return json.decode(response.body);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final realController =
      TextEditingController(); //! ARMAZENA OS VALORES BUSCADO PELA API */
  final dolarController =
      TextEditingController(); //! ARMAZENA OS VALORES BUSCADO PELA API */
  final euroController =
      TextEditingController(); //! ARMAZENA OS VALORES BUSCADO PELA API */
  double dolar = 0.0;
  double euro = 0.0;

//Calcula Dolar e Euro sabendo o valor em real
  VoidCallback? _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text =
        (real / dolar).toStringAsFixed(2); //! faz o calculo de conversão */
    euroController.text =
        (real / euro).toStringAsFixed(2); //! faz o calculo de conversão */
    return null;
  }

//Calcula Real e Euro sabendo o valor em dolar
  VoidCallback? _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar)
        .toStringAsFixed(2); //! faz o calculo de conversão */
    euroController.text = (dolar * this.dolar / euro)
        .toStringAsFixed(2); //! faz o calculo de conversão */
    return null;
  }

//Calcula Dolar e Real sabendo o valor em euro; a
  VoidCallback? _euroChanged(String text) {
    double euro = double.parse(text);
    realController.text =
        (euro * this.euro).toStringAsFixed(2); //! faz o calculo de conversão */
    dolarController.text = (euro * this.euro / dolar)
        .toStringAsFixed(2); //! faz o calculo de conversão */
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text(widget.title)),
        ),
        //
        body: FutureBuilder<Map>(
            future: getData(), //! faz o busca dos dados futuros */
            //snapshot - representa um instantâneo dos dados recebidos
            builder: (context, snapshot) {
              //! bate uma "foto" naquele momento dos dados */
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                      child: Text(
                    "Aguarde...", //! Caso não consiga fazer a consulta */
                    style: TextStyle(
                        color: Color.fromARGB(255, 249, 31, 31),
                        fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ));
                default:
                  if (snapshot.hasError) {
                    String? erro = snapshot.error.toString();
                    return Center(
                        child: Text(
                      "Ops, houve uma falha ao buscar os dados : $erro",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 4, 4),
                          fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
                  } else {
                    dolar = snapshot.data!["results"]["currencies"]["USD"]
                        ["buy"]; //! armazena o tipo de moeda e valor dela */
                    euro =
                        snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //Icone de cifrão
                          const Icon(Icons.attach_money,
                              size: 180.0,
                              color: Color.fromARGB(255, 255, 30, 30)),
                          campoTexto(
                              "Reais", "R\$ ", realController, _realChanged),
                          const Divider(),
                          campoTexto(
                              "Euros", "€ ", euroController, _euroChanged),
                          const Divider(),
                          campoTexto("Dólares", "US\$ ", dolarController,
                              _dolarChanged),
                        ],
                      ),
                    );
                  }
              }
            }));
  }

  //Widget customizado
  Widget campoTexto(
      String label, String prefix, TextEditingController c, Function? f) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 184, 15, 15)),
          border: const OutlineInputBorder(),
          prefixText: prefix),
      style: const TextStyle(color: Color.fromARGB(255, 198, 25, 25), fontSize: 25.0),
      onChanged: (value) => {f!(value)},
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
