import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tela de Login"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(10)),
          Text("FaÇa o seu login."),
        ));
  }
}
/* Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formCalc.currentState!.validate()) {
                        _calcTotal();
                      }
                      Navigator.of(context)
                          .pushNamed('/tela2'); 
                    },
                    child: const Text('Calcular com 10%'),
                  ),
                ), 
                
*/