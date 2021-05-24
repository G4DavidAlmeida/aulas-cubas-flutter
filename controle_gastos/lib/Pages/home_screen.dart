import 'package:controle_gastos/components/Task.dart';
import 'package:controle_gastos/components/TaskCard.dart';
import 'package:controle_gastos/repository/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    final title = 'Todo List';
    TextEditingController descricaoController = TextEditingController();

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: descricaoController,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              TaskDataBase.salvar(
                                  Task(descricaoController.text, true));
                              _tasks.add(Task(descricaoController.text, true));
                            });
                          },
                          child: Text("Adicionar")))
                ]),
                Expanded(
                  child: FutureBuilder(
                    future: TaskDataBase.listTask(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        if (snapshot.data != null) {
                          _tasks = snapshot.data;
                          return Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ListView.builder(
                                itemCount: _tasks.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: TaskCard(_tasks[index]),
                                    onLongPress: () {
                                      _tasks[index].enable = false;
                                    },
                                  );
                                }),
                          );
                        } else {
                          return Text('Carregando...');
                        }
                      }
                    },
                  ),
                  /*
                  child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: TaskCard(_tasks[index]),
                        onLongPress: () {
                          setState(() {
                            _tasks[index].enable = false;
                          });
                        },
                      );
                    },
                  ),
                  */
                )
              ],
            )),
      ),
    );
  }
}
