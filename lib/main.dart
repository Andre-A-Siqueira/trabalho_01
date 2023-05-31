import 'package:flutter/material.dart';
import 'package:trabalho_01/cotacao_page2.dart';
/* import 'package:share_plus/share_plus.dart'; */

import 'login_page.dart';
import 'principal_page.dart';
import 'cotacao_page.dart';
import 'transferencia.dart';
import 'tela_apresentacao.dart';

void main(List<String> args) async {
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
        title: 'Aplicativo do Banco',
        debugShowCheckedModeBanner: false, // Remove o icone de debug
        theme: ThemeData(
          //?Cores temas do aplicativo
          hintColor: const Color.fromARGB(255, 192, 143, 74),
          primaryColor: const Color.fromARGB(255, 255, 255, 255),
          primarySwatch: Colors.red, //? Cor tema do aplicativo  */
        ),
        //home: const TelaConta() DEVE SER REMOVIDO PARA ROTAS, //Chama classe dinâmica criada
        initialRoute: '/', //Rota inicial "raiz"
        routes: {
          //! Acesso as rotas das telas */
          '/': (context) => const TelaConta(),
          '/tela2': (context) => const Tela2(),
          '/principal': (context) => const Principal(),
          '/login': (context) => const Login(),
          '/cotacao': (context) => const Cotacao(),
          '/cotacao2': (context) => const Cotacao2(),
          '/transferencia': (context) => const Transferencia(),
          '/teste': (context) => const Teste(),
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
            title: const Text('Developers Bank')), //! Nome do app bank */
        body: Form(
          //Formulário
          key:
              _formCalc, // chave usada para identificação GlobalKey<FormState>()
          //!  child: Column(
          child: ListView(
              //! Troque "Column" por "ListView"  para usar o "ScrownPage"*/
              scrollDirection:
                  Axis.vertical, //? Diz o sentido do Scroll para vertical */
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //! Botão. */
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/principal');
                    },
                    child: const Text("Tela Principal Banco"),
                  ),
                ),

                //! Botão. */
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: const Text("Tela Login"),
                  ),
                ),

                //! Botão. */
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cotacao2');
                    },
                    child: const Text("Tela de CotaÇão"),
                  ),
                ),

                //! Botão. */
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/transferencia');
                    },
                    child: const Text("Tela de transferencia"),
                  ),
                ),
                /* Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Teste');
                    },
                    child: const Text("Tela de Teste"),
                  ),
                ), */
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
