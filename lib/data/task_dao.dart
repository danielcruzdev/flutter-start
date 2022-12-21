import 'package:sqflite/sqlite_api.dart';
import '../components/task.dart';
import 'database.dart';

class TaskDao {
  static const String _tableName = 'task';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String onCreate = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print('Procuranco dados no banco de dados... encontrado $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeTarefa) async {
    print('Acessando find: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeTarefa]);

    print('tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  save(Task task) async {
    print('iniciando o save: ');
    final db = await getDatabase();
    var itemExists = await find(task.nome);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      print('A tarefa não existe.');
      return await db.insert(_tableName, taskMap);
    } else {
      print('A tarefa ja existe');
      return await db.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.nome],
      );
    }
  }

  delete(String nomeTarefa) async {
    print('deletando tarefa: ');
    final db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;

    print('mapa de tarefa: $mapaDeTarefas');

    return mapaDeTarefas;
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo map para list');
    final List<Task> tarefas = [];

    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }

    print('Lista de tarefas: $tarefas');
    return tarefas;
  }
}
