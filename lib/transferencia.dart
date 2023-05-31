import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

/*class Transferencia extends StatelessWidget {
  const Transferencia({super.key});

  //Método privado para compartilhamento
  void _compartilhar() {
    Share.share("Compartilhar nota fiscal.");
  } 

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Transferencia!!!")),
        body: ListView(children: const <Widget>[
          Text("Veja a Transferencia"),
        ]));
  }
}*/

class Transferencia extends StatefulWidget {
  const Transferencia({super.key});

  @override
  TransferPageState createState() => TransferPageState();
}

//Método privado para compartilhamento
void _compartilhar() {
  Share.share("Compartilhar nota fiscal.");
}

class TransferPageState extends State<Transferencia> {
  TextEditingController accountController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  bool _isTransferConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferencia Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          //? Troquei o "Column" por "ListView"
          scrollDirection: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! Campo Numero COnta */
            TextField(
              controller: accountController,
              decoration: const InputDecoration(
                labelText: 'Numero da conta',
              ),
            ),
            const SizedBox(height: 16.0),

            //! Campo Quantidade */
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                //! Quando Pressionado faÇa ... */
                String accountNumber = accountController.text;
                String amount = amountController.text;

                if (accountNumber.isNotEmpty && amount.isNotEmpty) {
                  setState(() {
                    _isTransferConfirmed = true;
                  });
                }
              },
              child: const Text('Confirme a Transferencia'),
            ),
            const SizedBox(height: 16.0),
            if (_isTransferConfirmed)
              Column(
                children: [
                  //! Box de confirma;ão de transferencia */
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 204, 111, 109), //? Cor da BOX
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Transferência bem-sucedida!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Quantidade: R\$${amountController.text}', //! Texto de transferencia */
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //! Botão compartilhar */
                            ElevatedButton(
                              onPressed: () {
                                //! Chamar o compartilhar.
                                _compartilhar();
                                //print('Share transaÇão');
                              },
                              child: const Text('Compartilhar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
