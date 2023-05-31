import 'package:flutter/material.dart';

/* class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Principal!!!")),
        body: const Text("Veja a cotaÇão"));
  }
} */

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () { //! Quando precionado execute o que estiver a seguir.. */
                Navigator.pushNamed(
                    context, '/transfer'); //! Endere;o que deve acessar */
              },
              child: const Text('Transferencia'),
            ),
          ],
        ),
      ),
    );
  }
}

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //! ExpaÇãmento */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //! Centraliza;ão */
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Numero da conta'),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Quantidade',
              ),
            ),
            const SizedBox(height: 32.0), //! Tamanho da BOX */
            ElevatedButton(
              onPressed: () {
                // Transfer logic here
                //print('Transferencia'); //! <<<<<<<<>>>>>>>>>  */
              },
              child: const Text('Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}
