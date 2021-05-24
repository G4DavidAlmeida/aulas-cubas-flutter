# controle_gastos

## objetivos
- A aplicação deve ser do tipo Dinamica
- Inclusão de uma ação de adicionar novas infos na lista
- Inclusão de uma tela/componente de input de dados
- Atualizar a lista (StatefulWidget Widget)
- Listener na lista para remover componentes
## main page
~~~dart
import 'package:base/components/CardDisplay.dart';
import 'package:flutter/material.dart';

import 'components/Compra.dart';

List<Compra> _compras = [
  Compra("Tomate", "5 kg"),
  Compra("Cebola", "10 Kg"),
  Compra("Batata", "5 Kg"),
  Compra("Beringela", "5 Kg"),
  Compra("Cenoura", "5 Kg")
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: _compras.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: CardDisplay(_compras[index]),
              onLongPress: () {
                print(_compras[index].titulo);
              },
            );
            //
          },
        ),
      ),
    );
  }
}
~~~
## card element
~~~dart
import 'package:flutter/material.dart';

import 'Compra.dart';

class CardDisplay extends StatelessWidget {
  Compra compra;

  CardDisplay(this.compra);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network('https://picsum.photos/250?image=9', width: 100),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(this.compra.titulo),
                SizedBox(height: 10.0),
                Text(this.compra.subtitulo),
              ],
            )
          ],
        ),
      ),
    );
  }
}
~~~

## information class base
~~~dart
  
  class Compra {
  String titulo;
  String subtitulo;
  Compra(this.titulo, this.subtitulo);
}

~~~