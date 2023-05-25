import 'package:flutter/material.dart';


import 'login_page.dart';
import 'principal_page.dart';
import 'cotacao_page.dart';
import 'transferencia.dart';

void main() {
  runApp(const MeuPrimeiroAplicativo());
}

class MeuPrimeiroAplicativo extends StatelessWidget {
  // Classe Estática

  const MeuPrimeiroAplicativo(
      {super.key}); //método construtor (Cria o Objeto e usa extende os métodos da super classe)

  @override //Sobrescrita
  Widget build(BuildContext context) {
    return MaterialApp(
        // Widget material design
        title: 'Aplicativo de Cálculo',
        debugShowCheckedModeBanner: false, // Remove o icone de debug
        theme: ThemeData(
          primarySwatch: Colors.red, //? Cor tema do aplicativo  */
        ),
        //home: const TelaConta() DEVE SER REMOVIDO PARA ROTAS, //Chama classe dinâmica criada
        initialRoute: '/', //Rota inicial "raiz"
        routes: {
          '/': (context) => const TelaConta(),
          '/tela2': (context) => const Tela2(),
          '/principal': (context) => const Principal(),
          '/login': (context) => const Login(),
          '/cotacao': (context) => const Cotacao(),
          '/transferencia': (context) => const Transferencia(),
        });
  }
}

class TelaConta extends StatefulWidget {
  //? Projeto original Cria a Classe TelaConta()  */
  //Classe dinâmica
  const TelaConta(
      {super.key}); // método construtor (Cria o Objeto e usa extende os métodos da super classe)

  @override
  State<StatefulWidget> createState() {
    return _CalcContaEstado(); //Chama a classe de cálculo
  }
}

class _CalcContaEstado extends State<TelaConta> {
  // atributos  privados
  final _formCalc = GlobalKey<
      FormState>(); // atribuição única de chave para o formulário para atualizar o estado do widget
  


  // método “build” sobrescrito
  // (é dentro do build que vamos criar
  // os Widgets que o usuário vai interagir)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Developers Bank')), //? Nome do app bank */
        body: Form(
          //Formulário
          key:
              _formCalc, // chave usada para identificação GlobalKey<FormState>()
          child: ListView(
              //? Troquei "Column" por "ListView"  para usar o "ScrownPage"*/
              scrollDirection:
                  Axis.vertical, //? Posso trocar para horizontal */
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //!O projeto se inicia apartir daqui.
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/principal');
                    },
                    child: const Text("Tela Principal Banco"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text("Tela Login"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cotacao');
                    },
                    child: const Text("Tela de CotaÇão"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/transferencia');
                    },
                    child: const Text("Tela de transferencia"),
                  ),
                ),
              ]),
        )); // fechamento de parentesis e colchete
  }
}

//Criação da Tela 2
class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tela 2 !!!")),
        body: const Text("Funcionou a tela 2"));
  }
}
