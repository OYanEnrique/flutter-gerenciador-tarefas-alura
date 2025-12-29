import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(onPressed: () {setState(() {
            print('Recarregando a tela inicial');
          });
          }, icon: const Icon(Icons.refresh)),
        ],
        title: const Text('Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70), 
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(), 
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(), 
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(), 
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(), 
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length, 
                      itemBuilder: (BuildContext context, int index) {
                        final Task tarefa = items[index];
                        return tarefa;
                      }
                    );
                  } else {
                    return const Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 128), 
                          Text(
                            'Nenhuma tarefa cadastrada', 
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                    );
                  }
                }
                return const Text('Erro ao carregar tarefas');
            }
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value)=> setState(() {print('Recarregando a tela inicial');}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
