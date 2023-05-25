import 'package:flutter/material.dart';

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