import 'package:flutter/material.dart'; /*Os importes para acessar o  conteudo de outras paginas */
import 'package:flutter/services.dart'; /*Os importes para acessar o  conteudo de outras paginas */

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tela de Login"), /* Nome da Tela */
          centerTitle: true, /* centralizar titulo */
        ),
        body: Center(
            child: ListView(children: <Widget>[  //? "ListView" permite fazer o scrow na pagida descer na tela. */
          //? Troquei "Column" por "ListView"  para usar o "ScrownPage"*/

          const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                keyboardType: TextInputType.number, //! Tipo de dados aceito aqui "NUMÉRO " */
                inputFormatters: [
                  FilteringTextInputFormatter
                      .singleLineFormatter //! TIpo de entrada Texto */
                ],
                decoration:
                    const InputDecoration(hintText: 'Digite seu email.'), //! Campo para inserir email  */
                validator: (value) {
                  // Diferença entre TextField e TextFormField
                  if (value!.isEmpty) { //! Só ira amostrar a mensagem de erro se nada for inserido */
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],//! Tipo de dados aceito aqui "NUMÉRO " */
                /* TIpo de entrada numero */
                decoration:
                    const InputDecoration(hintText: 'Digite a sua senha.'),//! Campo para inserir senha  */
                validator: (value) {
                  // Diferença entre TextField e TextFormField
                  if (value!.isEmpty) { //! Só ira amostrar a mensagem de erro se nada for inserido */
                    return 'Informe um valor';
                  }
                  return null;
                }),
          ),

          //! "pushNamed" cria o botão de voltar  */
          //! "pushReplacementNamed" substitui a página  */
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton( //! BOTÃO DE LOGIN */
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/'); //! AVANÇAR A PAGINA */
                },
                child: const Text('Logar.')), //! TEXTO DO BOTÃO */
          )
        ])));

    //Text("FaÇa o seu login.")));
  }
}

