import 'package:flutter/material.dart';
import 'package:listagem_produtos/components/CardDisplay.dart';
import 'package:listagem_produtos/pages/HomeScrenn/Backgroun.dart';
import 'package:listagem_produtos/models/produtos.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String _nome_produto = "";
  String _peso_produto = "";
  List<Compra> _compras = [Compra("Tomate", "5 kg")];

  @override
  Widget build(BuildContext context) {
    return BackgroundHome(
      children: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _compras.add(Compra(_nome_produto, _peso_produto));
                    });
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  onChanged: (value) {
                    setState(() {
                      _nome_produto = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Valor"),
                  onChanged: (value) {
                    setState(() {
                      _peso_produto = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _compras.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onLongPress: () {
                      print("editar produto clicado");
                    },
                    child: CardDisplay(
                      produto: _compras[index],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
