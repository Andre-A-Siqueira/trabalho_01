import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            child: ListView(children: <Widget>[
          //? Troquei "Column" por "ListView"  para usar o "ScrownPage"*/

          const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.;0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration:
                    const InputDecoration(hintText: 'Digite seu email.'),
                validator: (value) {
                  // Diferença entre TextField e TextFormField
                  if (value!.isEmpty) {
                    return 'Informe um valor';
                  }
                  return null;
                }),
          ),
          //
          //
          //
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration:
                    const InputDecoration(hintText: 'Digite a sua senha.'),
                validator: (value) {
                  // Diferença entre TextField e TextFormField
                  if (value!.isEmpty) {
                    return 'Informe um valor';
                  }
                  return null;
                }),
          ),

          //! "pushNamed" cria o botão de voltar  */
          //! "pushReplacementNamed" substitui a página  */
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: const Text('Logar.')),
          )
        ])));

    //Text("FaÇa o seu login.")));
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