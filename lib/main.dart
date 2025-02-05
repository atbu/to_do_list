import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _todos = <Key, String>{
    Key("1"): "Todo 1",
    Key("2"): "Todo 2",
  };
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('To Do List'),
        trailing: Icon(CupertinoIcons.add),
      ),
      child: SafeArea(
        child: CupertinoListSection(
          header: const Text('Your To-Dos'),
          children: <CupertinoListTile>[
            for(var todo in _todos.entries)
              CupertinoListTile(
                key: todo.key,
                leading: CupertinoCheckbox(
                  value: !_todos.containsKey(todo.key),
                  onChanged: (bool? value) {
                    setState(() {
                      if(value == true) {
                        _todos.remove(todo.key);
                      }
                    });
                  }
                ),
                title: Text(todo.value),
              ),
          ]
        ),
      ),
    );
  }
}
