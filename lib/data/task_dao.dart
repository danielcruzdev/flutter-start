import '../components/task.dart';

class TaskDao {
  static const String _tableName = 'task';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String onCreate = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  Future<List<Task>> findAll() async {}

  Future<Task> find(String nomeTarefa) async {}

  save(Task task) async {}

  delete(String nomeTarefa) async {}
}
