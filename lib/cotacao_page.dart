import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cotacao extends StatelessWidget {
  const Cotacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cotacao!!!")),
        body: const Text("Veja a cotaÇão"));
  }
}

//? Passo 3:
//? Método que vai acessar os dados via API.
Future<Map> getData() async {
  var url =
      Uri.parse('https://api.hgbrasil.com/finance?format=json&key=2abee24e');
  http.Response response = await http.get(url);
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  return json.decode(response.body);
}

//?Passo 4:
//? Criação da tela com estado dinâmico
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  //_MyHomePageState createState() => _MyHomePageState();
}

//? Passo 5.1:
//? Criação do estado da tela dinâmica
class _MyHomePageState extends State<MyHomePage> {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  double dolar = 0.0;
  double euro = 0.0;

/*   @override
  Widget build(BuildContext context) {
    // Implementação do método build
    throw UnimplementedError();
  } */

  //? Passo 5.3:
  //?Método que calcula o valor de dólar e euro, dado o valor em real.
  //!VoidCallback? _realChanged(String text) {
  void _realChanged(String text) {
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

//? Passo 5.4:
//? Método que calcula o valor de real e euro, dado o valor em dólar

// código anterior
//!VoidCallback? _dolarChanged(String text) {
  void _dolarChanged(String text) {
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  //? Passo 5.5:
  //?Método que calcula o valor de dólar e real, dado o valor em euro
  //*class _MyHomePageState extends State<Home> {
  //* código anterior
  void _euroChanged(String text) {
    //!VoidCallback? _euroChanged(String text){
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

//? Passo 5.6:
//?Método build. Já conhecido por nós.
//*class _MyHomePageState extends State<Home> {
//* código anterior
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Conversor de moeda"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ), // AppBar

        //? Passo 5.7
        //*class _MyHomePageState extends State<Home> {
        //* código anterior
        body: FutureBuilder<Map>(
            //A chamada para o método que interage com a API é feita dentro do widget  FutureBuilder
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                //Um switch-case é criado para gerenciar o que acontece em cada caso da conexão com a API
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                      child: Text(
                    "Aguarde...",
                    style: TextStyle(color: Colors.green, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ) // Text
                      ); // continua

                //? Passo 5.8:
                //*class _MyHomePageState extends State<Home> {
                //* código anterior
                default:
                  if (snapshot.hasError) {
                    //A opção default do switch-case verifica se não teve erro

                    String? erro = snapshot.error.toString();
                    return const Center(
                        child: Text(
                      "Ops, houve uma falha ao buscar os dados : $erro",
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ));
                    //! continua

                    //? Passo 5.9:
                    //*class _MyHomePageState extends State<Home> {
                    //* código anterior
                    //*default:
                    // código anterior
                  } else {
                    //?Se não houver erro, preenche a tela com os resultados
                    dolar =
                        snapshot.data!["results"]["currencies"]["USD"]["buy"];
                    euro =
                        snapshot.data!["results"]["currencies"]["EUR"]["buy"];
                    //! continua

                    //?Passo 5.10:
                    //class _HomeState extends State<Home> {
                    // código anterior
                    //default:
                    // código anterior
                    return SingleChildScrollView(
                      //Uso do SingleChildScrollView para adequar o layout
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Icon(Icons.attach_money,
                              size: 180.0, color: Colors.green),
                          campoTexto(
                              "Reais", "R\$ ", realController, _realChanged),
                          //?“campoTexto” é um widget customizado. A sua construção é mostrada no próximo slide
                          const Divider(),
                          campoTexto(
                              "Euros", "€ ", euroController, _euroChanged),
                          //?“campoTexto” é um widget customizado. A sua construção é mostrada no próximo slide
                          const Divider(),
                          campoTexto("Dólares", "US\$ ", dolarController,
                              _dolarChanged),
                          //?“campoTexto” é um widget customizado. A sua construção é mostrada no próximo slide
                        ],
                      ),
                    );
                  }
              }
            }));
  }
} // Fim class _MyHomePageState extends State<MyHomePage>

//? Passo 5.11:
//?O método campoTexto permite a reutilização de código
Widget campoTexto(
    String label, String prefix, TextEditingController c, Function? f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.green),
        border: const OutlineInputBorder(),
        prefixText: prefix),
    style: const TextStyle(color: Colors.green, fontSize: 25.0),
    onChanged: (value) => {f!(value)},
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}
