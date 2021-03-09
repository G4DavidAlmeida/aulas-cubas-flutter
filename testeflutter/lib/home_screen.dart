import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "menu de navegação",
            onPressed: null,
          ),
          title: Text("Minha Aplicação"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Buscar',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.add),
              tooltip: 'Buscar',
              onPressed: null,
            ),
          ],
        ),
        body: HomePageBodyState());
  }
}

class HomePageBodyState extends StatefulWidget {
  @override
  _HomePageBodyStateState createState() => _HomePageBodyStateState();
}

class _HomePageBodyStateState extends State<HomePageBodyState> {
  String main_text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Row(
        children: [
          Column(
            children: [Text('1X1'), Text('1X2'), Text('1X3')],
          ),
          Column(
            children: [Text('2X1'), Text('2X2'), Text('2X3')],
          ),
        ],
      ),
    ));
  }
}

/*
class _HomePageBodyStateState extends State<HomePageBodyState> {
  String main_text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/praia.jpg'),
          height: 230,
        ),
        Text("Título",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Container(
          child: Text(
            main_text,
            textAlign: TextAlign.justify,
          ),
          padding: EdgeInsets.all(25),
        ),
        Text(
          "Assinatura",
          style: TextStyle(fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
*/

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Olá Flutter 2",
    home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "menu de navegação",
          onPressed: null,
        ),
        title: Text("Minha Aplicação"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Buscar',
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Buscar',
            onPressed: null,
          ),
        ],
      ),
      body: Center(child: Text("Olá Flutter")),
    ),
  ));
}
*/
