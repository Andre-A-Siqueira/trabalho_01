import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          primarySwatch: Colors.blue,
        ),
        //home: const TelaConta() DEVE SER REMOVIDO PARA ROTAS, //Chama classe dinâmica criada
        initialRoute: '/', //Rota inicial "raiz"
        routes: {
          '/': (context) => const TelaConta(),
          '/tela2': (context) => Tela2(),
        });
  }
}

class TelaConta extends StatefulWidget {
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
  double _valor = 0.0;
  dynamic _valorTotal;

  // método privado
  void _calcTotal() {
    setState(() {
      _valorTotal = (_valor * 110 / 100).toStringAsFixed(2); // Calcula os 10%
    });
  }

  // método “build” sobrescrito
  // (é dentro do build que vamos criar
  // os Widgets que o usuário vai interagir)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Conta')),
        body: Form(
          //Formulário
          key:
              _formCalc, // chave usada para identificação GlobalKey<FormState>()
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration:
                        const InputDecoration(hintText: 'Valor da conta'),
                    validator: (value) {
                      // Diferença entre TextField e TextFormField
                      if (value!.isEmpty) {
                        return 'Informe um valor';
                      } else {
                        _valor = double.parse(value);
                        if (_valor <= 0) {
                          return 'O valor deve ser maior que zero';
                        }
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    //Botão
                    onPressed: () {
                      if (_formCalc.currentState!.validate()) {
                        //Validação do que foi digitado se validado chama o método
                        _calcTotal();
                      }
                      Navigator.of(context).pushNamed('/tela2');
                    },
                    child: const Text('Calcular com 10%'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    //Botão
                    onPressed: () {
                      // Reset "Limpa" os dados da tela
                      _formCalc.currentState!.reset();
                    },
                    child: const Text('Limpar'),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Valor total R\$ $_valorTotal',
                      style: const TextStyle(fontSize: 20),
                    ))
              ]),
        )); // fechamento de parentesis e colchete
  }
}
//Criação da Tela 2
class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tela 2 !!!")),
        body: Text("Funcionou a tela 2"));
  }
}


