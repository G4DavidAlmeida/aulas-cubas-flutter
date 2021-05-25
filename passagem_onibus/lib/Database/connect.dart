import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connect {
  static final Connect _singleton = new Connect();

  factory Connect() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "passagemOnibus.db");

    var connection = await openDatabase(localDatabase,
        version: versiondb, onCreate: Connect._onCreate);
    return connection;
  }

  static OnDatabaseCreateFn _onCreate(db, versiondb) {
    db.execute("""
    CREATE TABLE passageiros (
      id          INTERGER PRIMARY KEY,
      descricao   VARCHAR,
      enable      INTEGER
    )
    """);
  }

  /* static List<Task> converteToListTask(List<dynamic> queryset) {
    List<Task> _tasks = [];
    for (var item in queryset) {
      var task =
          new Task(item['descricao'], item['enable'] == 1 ? true : false);
      task.id = item['id'];
      _tasks.add(task);
    }
    return _tasks;
  }

  static salvar(Task task) async {
    Database bd = await _dataBaseManager();
    Map<String, dynamic> dadosTask = {
      "descricao": task.descricao,
      "enable": 1,
    };
    int id = await bd.insert("task", dadosTask);
    print("Salvo:  $id");
  }

  static Future listTask() async {
    Database bd = await _dataBaseManager();
    List listaTasks = await bd.query("task");
    return TaskDataBase.converteToListTask(listaTasks.toList());
  }

  static disableTask(Task task) async {
    Database bd = await _dataBaseManager();
    Map<String, dynamic> dadosTask = {
      "descricao": task.descricao,
      "enable": 0,
    };
    bd.update("task", dadosTask, where: "id = ?", whereArgs: [task.id]);
  } */
}
