import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 
      'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT, '
      '$_nivel INTEGER)';

  static const String _tablename = 'taskTable2';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _nivel = 'nivel';

  save(Task tarefa) async {
    print('Acessando o save');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existe, salvando nova tarefa: ${tarefa.nome}');
      return await bancoDeDados.insert(
        _tablename,
        taskMap,
      );
    } else {
      print('A tarefa já existe, atualizando tarefa: ${tarefa.nome}');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }
    Map<String, dynamic> toMap(Task tarefa){
      print('Convertendo tarefa em Map: ${tarefa.nome}');
      final Map<String, dynamic> mapaDeTarefas = {};
      mapaDeTarefas[_name] = tarefa.nome;
      mapaDeTarefas[_difficulty] = tarefa.dificuldade;
      mapaDeTarefas[_image] = tarefa.foto;
      mapaDeTarefas[_nivel] = tarefa.nivel;
      print('Mapa de Tarefas: $mapaDeTarefas');
      return mapaDeTarefas;
    }
  Future<List<Task>> findAll() async {
    print('Acessando o findall');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados...encontrado: $result');
    return toList(result);
  }
  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas){
    print('Convertendo to List');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
        linha[_nivel] ?? 0,
      );
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas: $tarefas');
    return tarefas;
  }
  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando o find');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Procurando dados no banco de dados...encontrado: ${toList(result)}');
    return toList(result);
  }
  delete(String nomeDaTarefa) async {
    print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}