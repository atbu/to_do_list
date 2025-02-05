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
  final _todos = <String>[
    "Todo 1",
    "Todo 2",
  ];
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('To Do List'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: () {
            Navigator.of(context).restorablePush(_dialogBuilder);
          },
          child: Icon(CupertinoIcons.add)
        ),
      ),
      child: SafeArea(
        child: CupertinoListSection(
          header: const Text('Your To-Dos'),
          children: <CupertinoListTile>[
            for(var todo in _todos)
              CupertinoListTile(
                leading: CupertinoCheckbox(
                  value: !_todos.contains(todo),
                  onChanged: (bool? value) {
                    setState(() {
                      if(value == true) {
                        _todos.remove(todo);
                      }
                    });
                  }
                ),
                title: Text(todo),
              ),
          ]
        ),
      ),
    );
  }

  @pragma('vm:entry-point')
  static Route<Object?> _dialogBuilder(
    BuildContext context, Object? arguments) {
      return CupertinoDialogRoute<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Add New To-Do'),
            content: const Text('Text box goes here.'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Create'),
              ),
            ],
          );
        });
    }
}

