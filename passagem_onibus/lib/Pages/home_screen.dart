import 'package:flutter/material.dart';
import 'package:passagem_onibus/Components/PassageiroItem.dart';
import 'package:passagem_onibus/Components/rounded_button.dart';
import 'package:passagem_onibus/Database/Passageiro.dart';
import 'package:passagem_onibus/Pages/form_client.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Passageiro> _passageiros = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: Passageiro.list(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      if (snapshot.data != null) {
                        _passageiros = snapshot.data;

                        if (_passageiros.length == 0)
                          return Text('Sem passageiros.');

                        return ListView.builder(
                          itemCount: _passageiros.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: PassageiroItem(
                                passageiro: _passageiros[index],
                              ),
                              onLongPress: () {
                                _passageiros[index]
                                    .remove()
                                    .then((value) => {setState(() {})});
                              },
                            );
                          },
                        );
                      } else {
                        return Text('Carregando...');
                      }
                    }
                  },
                ),
              ),
            ),
            RoundedButton(
              text: 'ADICIONAR PASSAGEIRO',
              press: this.navigateToFormClient,
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  void navigateToFormClient() {
    Route route = MaterialPageRoute(builder: (context) => FormClientPage());
    Navigator.push(context, route).then((value) => {setState(() {})});
  }
}
