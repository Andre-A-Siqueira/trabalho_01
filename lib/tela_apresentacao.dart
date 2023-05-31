import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
  //TransferPageState createState() => TransferPageState();
  //TestePageState createState() => TestePageState();
}

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Meu Banco'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Seja bem-vindo ao Meu Banco!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: const Text('Fazer Login'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login'); //! endere;o que deve acessar */
              },
            ),
          ],
        ),
      ),
    );
  }
}
