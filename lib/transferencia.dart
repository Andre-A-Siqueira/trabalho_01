import 'package:flutter/material.dart';
/* import 'package:share_plus/share_plus.dart'; */

class Transferencia extends StatelessWidget {
  const Transferencia({super.key});

  //Método privado para compartilhamento
/*   void _compartilhar() {
    Share.share("Compartilhar nota fiscal.");
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Transferencia!!!")),
        body: ListView(children: const <Widget>[
          Text("Veja a Transferencia"),
        ]));
  }
}
